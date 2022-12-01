const {Angelic} = require('angelic');
const route = require('./areas/app/routes');
// const {PrismaClient} = require('@prisma/client');

var app = new Angelic(__dirname);
app.areas = [
    'app',
]

// app.dbContext = new PrismaClient();
app.build();
module.exports = app;