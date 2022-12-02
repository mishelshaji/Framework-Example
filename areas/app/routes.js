const router = require('angelic/core/router');
const hc = require('./controllers/homeController');

module.exports = new router.Router().addRoutes('app',[
    {path: '/', controller: hc, action: 'getIndex'},
    {path: '/login', controller: hc, action: 'getLogin'},
]);