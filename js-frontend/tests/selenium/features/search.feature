Feature: Test Holidaymaker home page

    Background: Main page
        Given that I'm at the Holidaymaker home page

    Scenario: Search for available rooms
        When I choose Frankrike
        And I enter check-in date
        And I enter check-out date
        And I enter the number of adults
        And I enter the number of kids
        And I enter the number of babies
        And I click the Sök button
        Then The page shows the results.
