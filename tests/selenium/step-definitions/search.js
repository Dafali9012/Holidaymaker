let {$, sleep} = require('./funcs');

module.exports = function() {

  this.Given(/^that I'm at the search page$/, async function () {
    await helpers.loadPage('http://localhost:8080');
    await sleep(2000)
  });

}