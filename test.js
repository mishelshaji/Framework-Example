const Form = require('angelic/core/forms/form').default;
const TextField = require('angelic/core/forms/fields/textField').default;

class MyClass extends Form{
    name = new TextField('name', 'Name', {class:'form-control'});
}

const obj = new MyClass();
if(obj.name == instanceof)