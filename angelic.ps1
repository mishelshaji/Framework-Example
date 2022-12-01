function ShowHelp{
    Write-Host -Object "new - Creates a new project"
    Write-Host -Object "scaffold-area - Creates a new area"
    Write-Host -Object "enable-migrations - Enable migration and ORM support"
    Write-Host -Object "add-migration - Commit schema change to the database"
    Write-Host -Object "update-database - Generates schema type files"
}

function CreateProject {
    Write-Host -Object "
               _   _  _____ ______ _      _____ _____ 
         /\   | \ | |/ ____|  ____| |    |_   _/ ____|
        /  \  |  \| | |  __| |__  | |      | || |     
       / /\ \ | . ` | | |_ |  __| | |      | || |     
      / ____ \| |\  | |__| | |____| |____ _| || |____ 
     /_/    \_\_| \_|\_____|______|______|_____\_____|
                                                      
    "
    Write-Host -Object "Downloading Files" -ForegroundColor Green
    $path = 'https://github.com/mishelshaji/Framework-Example/archive/refs/heads/main.zip'
    Invoke-WebRequest -Uri $path -OutFile ./download.zip
    Expand-Archive -Path ./download.zip -DestinationPath .
    Get-ChildItem -Path ./Framework-Example-main -Recurse | Move-Item -Destination . -Verbose
    Get-ChildItem -Path ./Framework-Example-main -Recurse | Remove-Item
    Remove-Item -Path Framework-Example-main
    Remove-Item -Path download.zip

    # Installing dependencies
    Write-Host -Object "Installing Dependencies" -ForegroundColor Magenta
    npm init --y
    npm install nodemon --save-dev
    npm install handlebars --save
    npm install typescript --save
    npm install mysql2 --save
    npm install serve-static --save
    
    if([IO.File]::Exists('./bin.zip')){
        Expand-Archive -Path .\bin.zip -DestinationPath .
        npm i --save ./bin
    }
    else{
        npm i ../Angelic/bin
    }
    npx nodemon .\app.js
    Write-Host -Object "Project Initialization Complete" -ForegroundColor Yellow
}

function ScaffoldApp{
    $appName = Read-Host -Prompt "App name"

    # Creating directories
    New-Item -Path areas/$appName -ItemType Directory | Out-Null
    New-Item -Path areas/$appName/controllers -ItemType Directory | Out-Null
    New-Item -Path areas/$appName/views -ItemType Directory | Out-Null
    New-Item -Path areas/$appName/views/home -ItemType Directory | Out-Null
    New-Item -Path areas/$appName/views/shared -ItemType Directory | Out-Null

    # Creating files
    New-Item -Path areas/$appName/routes.js -ItemType File | Out-Null
    New-Item -Path areas/$appName/controllers/homeController.js -ItemType File | Out-Null
    New-Item -Path areas/$appName/views/home/index.hbs -ItemType File | Out-Null
}

function InitDb{
    npx prisma init
}

function AddMigration{
    npx prisma migrate dev
}

function UpdateDatabase{
    npx prisma generate
}

$option = $args[0];

if ($null -eq $option) {
    Write-Host -Object "Please provide an argument"
    ShowHelp
}
elseif($option -eq "new") {
    CreateProject
}
elseif($option -eq "scaffold-area"){
    ScaffoldApp
}
elseif($option -eq "enable-migrations"){
    InitDb
}
elseif($option -eq "add-migration"){
    AddMigration
}
elseif($option -eq "update-database"){
    UpdateDatabase
}