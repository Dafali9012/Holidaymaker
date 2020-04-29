Feature: Test Holidaymaker home page

    Background: Main page
        Given that I'm at the Holidaymaker home page

    Scenario: Log in
        When I click Login on menu
        And I enter User name
        And I enter Password
        And I click the Login button
        Then I am logged in.