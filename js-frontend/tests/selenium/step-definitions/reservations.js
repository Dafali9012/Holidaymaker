let { $, sleep } = require('./funcs');

let sleepTime = 1000;

module.exports = function () {

    this.Given(/^that i am on the Holidaymaker site$/, async function () {
        await helpers.loadPage('http://localhost:8081/');
        await sleep(sleepTime * 2);
    
        let text = await $('#homeButton > h2:nth-child(1)');
        let logoText = await text.getText();
        assert.include(logoText, "Bachman Hendricks");
      });

      this.Given(/^that i am logged in$/, async function () {
        driver.findElement(by.css("#loginButton")).click();
        await driver.wait(until.elementLocated(By.css("#app > div > form > div:nth-child(2) > input")))
        driver.findElement(by.css("#app > div > form > div:nth-child(2) > input")).click();
        driver.findElement(by.css("#app > div > form > div:nth-child(2) > input")).sendKeys('usch')
        driver.findElement(by.css("#app > div > form > div:nth-child(3) > input")).click();
        driver.findElement(by.css("#app > div > form > div:nth-child(3) > input")).sendKeys('hej')
        driver.findElement(by.css("#submitButton")).click();
        await driver.wait(until.elementLocated(By.css("#country")))
        let text = await $('#homeButton');
        let logoText = await text.getText();
        assert.include(logoText, "Bachman Hendricks");
      });

      this.Given(/^that i enter search data$/, async function () {

        await sleep(sleepTime)
        driver.findElement(by.css("#country")).click();
        driver.findElement(by.css("#country > option:nth-child(3)")).click();
        await driver.findElement(By.name("startdate")).sendKeys("2020-05-24")
        await driver.findElement(By.name("enddate")).sendKeys("2020-05-25")
        await sleep(sleepTime)
        driver.findElement(by.id("searchButton")).click();
        await sleep(sleepTime * 2)
        let text = await $('#app > div > div.container.bg-light > div > div:nth-child(1) > div.d-flex.flex-column.align-items-start.text-left.flex-grow-1.my-3.ml-3 > p:nth-child(1)')
        let hotelName = await text.getText()
        assert.include(hotelName, "G Hotel")
        
      });

      this.Given(/^press search$/, async function () {

        assert(true)
        
      });

      this.Given(/^click on a room$/, async function () {  

        driver.findElement(by.css("#app > div > div.container.bg-light > div > div:nth-child(1) > div.d-flex.justify-content-end.align-items-center.flex-grow-1 > a > button")).click();
        await sleep(sleepTime)
        
      });

      this.When(/^i press the booking button$/, async function () {
        driver.findElement(by.css("#app > div > div.container.border.rounded.py-3.text-left.bg-light > div.row.m-1.justify-content-between > div.col-2.text-right > button")).click();
        await sleep(sleepTime * 2)
        driver.switchTo().alert().accept();
        await sleep(sleepTime)
      });

      this.Then(/^i should have a booking$/, async function () {

        await driver.wait(until.elementLocated(By.css("#app > div > div.container.border.rounded.py-3.text-left.bg-light > div.container.border.rounded.py-3.text-left.allBookings > div:nth-child(1) > div > div.col-9 > p:nth-child(5)")))
        let startDate = await $('#app > div > div.container.border.rounded.py-3.text-left.bg-light > div.container.border.rounded.py-3.text-left.allBookings > div:nth-child(1) > div > div.col-9 > p:nth-child(5)')
        
        let startDateText = startDate.getText();
        console.log('här', startDateText)
        assert.include(startDateText[0], "Check In: 2020-05-24")
        let endDate = await $('#app > div > div.container.border.rounded.py-3.text-left.bg-light > div.container.border.rounded.py-3.text-left.allBookings > div:nth-child(1) > div > div.col-9 > p:nth-child(5)')
        let endDateText = endDate.getText()
        assert.include(endDateText[0], "Check Out: 2020-05-25")

        
      });

}