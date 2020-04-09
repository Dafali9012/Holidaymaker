Feature: Search Lumia


  Scenario: When I enter text in search
    Given that I'm at the search page
    When I enter search text "taklampa"
    And I click the search button
    Then the first test result should contain the word "taklampa"
