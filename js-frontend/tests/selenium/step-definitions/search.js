let { $, sleep } = require('./funcs');

let sleepTime = 1000;

module.exports = function () {


  this.Given(/^that I'm at the Holidaymaker home page$/, async function () {
    await helpers.loadPage('http://localhost:8081/');
    await sleep(sleepTime * 2);

    let text = await $('#homeButton > h2:nth-child(1)');
    let logoText = await text.getText();
    assert.include(logoText, "Bachman Hendricks", 'You could not get the correct page.');
    await sleep(sleepTime);
  });


  this.Given(/^I click Register on menu$/, async function () {
    let registerMenu = await $('#regButton')
    await registerMenu.click();
    await sleep(sleepTime);

    let text = await $('#homeButton > h2:nth-child(1)');
    let logoText = await text.getText();
    assert.include(logoText, "Bachman Hendricks", 'You could not get the correct page.');
    await sleep(sleepTime);
  });

  this.Given(/^I enter Email$/, async function () {
    await sleep(sleepTime)
    let myEmail = await $('div.row:nth-child(2) > input:nth-child(1)')
    await myEmail.sendKeys('letsgo@letsgo.com');
    await sleep(sleepTime);
  });

  this.Given(/^I enter Lösenord$/, async function () {
    await sleep(sleepTime)
    let myPassword = await $('div.row:nth-child(3) > input:nth-child(1)')
    await myPassword.sendKeys('121212zzz');
    await sleep(sleepTime);
  });

  this.Given(/^I enter Namn$/, async function () {
    await sleep(sleepTime)
    let myName = await $('div.row:nth-child(4) > input:nth-child(1)')
    await myName.sendKeys('Traveler');
    await sleep(sleepTime);
  });

  this.Given(/^I enter Telefon$/, async function () {
    await sleep(sleepTime)
    let myPhone = await $('div.row:nth-child(5) > input:nth-child(1)')
    await myPhone.sendKeys('0731112424');
    await sleep(sleepTime);
  });

  this.Given(/^I click the Registrera button and Popup shows that the signup is done$/, async function () {
    let signupButton = await $('#submitButton')
    await signupButton.click();
    await sleep(sleepTime);
  });

  this.When(/^I close the popup$/, async function () {
    console.log(driver.window_handles)

    driver.switch_to_window(driver.window_handles[1])
    driver.close();

    driver.switch_to_window(driver.window_handles[0])
    await sleep(sleepTime);
  });


  this.Then(/^Signip is done and get back to the main page\.$/, async function () {
    let text = await $('#homeButton > h2:nth-child(1)');
    let logoText = await text.getText();
    assert.include(logoText, "Bachman Hendricks", 'You could not get the correct page.');
    await sleep(sleepTime);
  });

  this.Given(/^I click Login on menu$/, async function () {
    let loginMenu = await $('#loginButton')
    await loginMenu.click();
    await sleep(sleepTime);

    let text = await $('#homeButton > h2:nth-child(1)');
    let logoText = await text.getText();
    assert.include(logoText, "Bachman Hendricks", 'You could not get the correct page.');
    await sleep(sleepTime);
  });

  this.Given(/^I enter User name$/, async function () {
    await sleep(sleepTime)
    let nameLogin = await $('div.row:nth-child(2) > input:nth-child(1)')
    await nameLogin.sendKeys('letsgo@letsgo.com');
    await sleep(sleepTime);
  });

  this.Given(/^I enter Password$/, async function () {
    await sleep(sleepTime)
    let passwordLogin = await $('div.row:nth-child(3) > input:nth-child(1)')
    await passwordLogin.sendKeys('121212zzz');
    await sleep(sleepTime);
  });

  this.Given(/^I click the Login button$/, async function () {
    let signupButton = await $('#submitButton')
    await signupButton.click();
    await sleep(sleepTime);
  });

  this.When(/^I choose Frankrike$/, async function () {
    let countryDrop = await $('#country > option:nth-child(2)');
    await countryDrop.click();
    await sleep(sleepTime);
  });

  this.Given(/^I enter check\-in date$/, async function () {
    await sleep(sleepTime)
    let checkinDate = await $('#checkIn')
    await checkinDate.click();
    await checkinDate.sendKeys('01052020');
    await sleep(sleepTime);
  });

  this.Given(/^I enter check\-out date$/, async function () {
    await sleep(sleepTime)

    find_elements_by_xpath//*[@id="checkIn"]

    let checkoutDate = await $('#checkOut')
    await checkoutDate.click();


    await checkoutDate.sendKeys('05052020');
    await sleep(sleepTime);
  });

  this.When(/^I enter the number of adults$/, async function () {
    let numberAdults = await $('#adults > option:nth-child(3)');
    await numberAdults.click();
    await sleep(sleepTime);
  });

  this.When(/^I enter the number of kids$/, async function () {
    let numberKids = await $('#kids > option:nth-child(2)');
    await numberKids.click();
    await sleep(sleepTime);
  });

  this.When(/^I enter the number of babies$/, async function () {
    let numberBabies = await $('#smallkids > option:nth-child(2)');
    await numberBabies.click();
    await sleep(sleepTime);
  });

  this.Given(/^I click the Sök button$/, async function () {
    let searchButton = await $('#searchButton')
    await searchButton.click();
    await sleep(sleepTime);
  });
}
