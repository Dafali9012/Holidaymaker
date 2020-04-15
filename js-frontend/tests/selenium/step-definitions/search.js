let {$, sleep} = require('./funcs');

let sleepTime = 1000;

module.exports = function() {


  this.Given(/^that I'm at the Holidaymaker home page$/, async function () {
    await helpers.loadPage('http://localhost:8080/');
    await sleep(sleepTime * 2);

    let groupMessage = await $('div.d-flex:nth-child(1) > h2:nth-child(1)');
    let text = await groupMessage.getText();
    assert.include(text, "Bachman Hendricks", 'You got the wrong page.');
    await sleep(sleepTime);
  });


  this.Given(/^I click Register on menu$/, async function () {
    let registerMenu = await $('#nav > a:nth-child(3)')
    await registerMenu.click();
    await sleep(sleepTime);

    let groupMessage = await $('div.d-flex:nth-child(1) > h2:nth-child(1)');
    let text = await groupMessage.getText();
    assert.include(text, "Bachman Hendricks", 'You got the wrong page.');
    await sleep(sleepTime);
  });

  this.Given(/^I enter my Email$/, async function () {
    await sleep(sleepTime)
    let myEmail = await $('input.form-control:nth-child(2)')
    await myEmail.sendKeys('letsgo@letsgo.com');
    await sleep(sleepTime);
  });

  this.Given(/^I enter Lösenord$/, async function () {
    await sleep(sleepTime)
    let myPassword = await $('input.form-control:nth-child(3)')
    await myPassword.sendKeys('121212zzz');
    await sleep(sleepTime);
  });

  this.Given(/^I enter Namn$/, async function () {
    await sleep(sleepTime)
    let myName = await $('input.form-control:nth-child(4)')
    await myName.sendKeys('Traveler');
    await sleep(sleepTime);
  });

  this.Given(/^I enter Telefon$/, async function () {
    await sleep(sleepTime)
    let myPhone = await $('input.form-control:nth-child(5)')
    await myPhone.sendKeys('0731112424');
    await sleep(sleepTime);
  });

  this.Given(/^I click the Registrera button to complete$/, async function () {
    let signupButton = await $('button.btn:nth-child(6)')
    await signupButton.click();
    await sleep(sleepTime);
  });

  this.Given(/^I click Login on menu$/, async function () {
    let loginMenu = await $('#nav > a:nth-child(4)')
    await loginMenu.click();
    await sleep(sleepTime);

    let groupMessage = await $('div.d-flex:nth-child(1) > h2:nth-child(1)');
    let text = await groupMessage.getText();
    assert.include(text, "Bachman Hendricks", 'You got the wrong page.');
    await sleep(sleepTime);
  });

  this.Given(/^I enter User name$/, async function () {
    await sleep(sleepTime)
    let nameLogin = await $('input.form-control:nth-child(2)')
    await nameLogin.sendKeys('letsgo@letsgo.com');
    await sleep(sleepTime);
  });

  this.Given(/^I enter Password$/, async function () {
    await sleep(sleepTime)
    let passwordLogin = await $('input.form-control:nth-child(3)')
    await passwordLogin.sendKeys('121212zzz');
    await sleep(sleepTime);
  });

  this.Given(/^I click the Login button$/, async function () {
    let signupButton = await $('button.btn:nth-child(4)')
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
    let checkinDate = await $('input.border:nth-child(2)')
    await checkinDate.click();
    await checkinDate.sendKeys('01052020');
    await sleep(sleepTime);
  });

  this.Given(/^I enter check\-out date$/, async function () {
    await sleep(sleepTime)
    let checkoutDate = await $('input.border:nth-child(2)')
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
    let searchButton = await $('button.btn:nth-child(4)')
    await searchButton.click();
    await sleep(sleepTime);
  });
}
