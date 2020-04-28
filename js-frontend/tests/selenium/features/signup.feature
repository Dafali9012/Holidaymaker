Feature: Test Holidaymaker home page

    Background: Main page
        Given that I'm at the Holidaymaker home page

    Scenario: Sign up
        When I click Register on menu
        And I enter Email
        And I enter Lösenord
        And I enter Namn
        And I enter Telefon
        And I click the Registrera button and Popup shows that the signup is done
        And I close the popup
        Then Signip is done and get back to the main page.
