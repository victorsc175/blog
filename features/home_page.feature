Feature: Home page

  In order to read Home page
  As a guest user
  I want to see Latest News list
  
  Scenario: guest user sees Home page
    Given I am a guest user
    When I go to the Home page
    Then I must see Latest News list
  
  Scenario: guest user go to Home page
    Given I am a guest user
    When I go to the Home page
    And I click on Home page link
    Then I must see Latest News list
    