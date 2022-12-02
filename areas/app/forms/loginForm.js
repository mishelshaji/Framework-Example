const Form = require('angelic/core/forms/form').default;
const {EmailField} = require('angelic/core/forms/fields/emailField');
const {TextField} = require('angelic/core/forms/fields/textField');
const {PasswordField} = require('angelic/core/forms/fields/passwordField');
const {SelectField} = require('angelic/core/forms/fields/selectField');
const {EmailValidator, MinLengthValidator} = require('angelic/core/validators');

class LoginForm extends Form{
    name = new TextField(
        'name', 
        'Name', 
        {class: 'form-control'},
        [

        ]);
    email = new EmailField('email', 'Email', {class: 'form-control'});
    role = new SelectField('role', 'Role', {class: 'form-control'}, null, [['admin', 'Admin']]);
    password = new PasswordField('password', 'Password', {class: 'form-control'});
    c_password = new PasswordField('c_password', 'Confirm Password', {class: 'form-control'});
}

module.exports = LoginForm;