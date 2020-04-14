Feature: Test Holidaymaker home page


    Scenario: Sign up
        Given that I'm at the Holidaymaker home page
        When I click Register on menu
        And I enter my Email
        And I enter Lösenord
        And I enter Namn
        And I enter Telefon
        And I click the Registrera button to complete
        Then Sign-up is finished and the page opens the next page.

    Scenario: Log in
        Given that I'm at the Holidaymaker home page
        When I click Login on menu
        And I enter User name
        And I enter Password
        And I click the Login button
        Then The user is logged in.