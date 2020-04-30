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
        Then Signup is done.

    Scenario: Log in
        When I click Login on menu
        And I enter User name
        And I enter Password
        And I click the Login button
        Then I am logged in.

    Scenario: Search for available rooms
        When I choose Frankrike
        And I enter check-in date
        And I enter check-out date
        And I enter the number of adults
        And I enter the number of kids
        And I enter the number of babies
        And I click the Sök button
        Then The page shows the results.