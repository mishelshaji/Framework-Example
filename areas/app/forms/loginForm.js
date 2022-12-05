const Form = require('angelic/core/forms/form').default;
const {
    EmailValidator,
    MinLengthValidator
} = require('angelic/core/validators')
const {
    EmailField,
    TextField,
    PasswordField,
    SelectField
} = require('angelic/core/forms/fields');

class LoginForm extends Form {
    email = new EmailField('email', 'Email', {
            class: 'form-control'
        },
        [
            new EmailValidator()
        ]);
    password = new PasswordField('password', 'Password', {
        class: 'form-control'
    },[
        new MinLengthValidator(20)
    ]);
}

module.exports = LoginForm;