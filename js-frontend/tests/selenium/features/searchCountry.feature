Feature: select countries

    Scenario: Finding countries in the drop-down menu
        Given that i am on the holidaymaker webpage
        When i click "välj land"
        Then i should get a list of countries