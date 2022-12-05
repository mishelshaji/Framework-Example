const {ControllerBase} = require('angelic/core/controllerBase');
const LoginForm = require('../forms/loginForm');

class HomeController extends ControllerBase {

    async getIndex(){
        return this.view('index');
    }

    getLogin(){
        var form = new LoginForm();
        return this.view('login', {form: form});
    }

    postLogin(){
        const form = new LoginForm().withData(this.formData);
        if(!form.isValid()){
            return this.view('login', {form: form});
        }
        return this.view('login', {form: form});
    }
}

module.exports = HomeController;
