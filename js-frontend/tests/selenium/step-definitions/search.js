let {$, sleep} = require('./funcs');

module.exports = function() {


  this.Given(/^that I'm at Lumia$/, async function () {
    await helpers.loadPage('http://localhost:8080/');
  });


}
