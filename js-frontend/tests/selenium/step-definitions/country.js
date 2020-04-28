let {$, sleep} = require('./funcs');

let sleepTime = 2000;

module.exports = function() {

    this.Given(/^that i am on the holidaymaker webpage$/, async function () {
        await helpers.loadPage('http://localhost:8081/');
        await driver.wait(until.elementLocated(By.css('#app > div > div.d-flex.justify-content-between.col.border.rounded.py-3.pl-5.text-left.bg-light > a > button > h2')))
        let text = await $('#app > div > div.d-flex.justify-content-between.col.border.rounded.py-3.pl-5.text-left.bg-light > a > button > h2');
        text = await text.getText();
        console.log('Texten är ', text)
        assert.include(text, "Bachman Hendricks");
        });

    this.When(/^i click "([^"]*)"$/, async function (button) {   
                button = await $('#country')
                button.click()
                await driver.wait(until.elementLocated(By.css('#app > div > div.d-flex.justify-content-between.col.border.rounded.py-3.pl-5.text-left.bg-light > a > button > h2')))
              });

    this.Then(/^i should get a list of countries$/, async function () {
                let field = await driver.findElement(by.css("#country > option:nth-child(2)"))
              field = await field.getAttribute("value")
              assert.deepEqual(field, 'Frankrike');
              });
  
}
