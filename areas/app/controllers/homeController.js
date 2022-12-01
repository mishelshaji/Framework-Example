const {ControllerBase} = require('angelic/core/controllerBase');

class HomeController extends ControllerBase {

    async getIndex(){
        return this.view('index');
    }
}

module.exports = HomeController;
