Feature: Home page

  In order to read Home page
  As a guest user
  I want to see Ruby news and articles list
  
  Scenario: gest user sees Home page
    Given I am a guest user
    When I go to the Home page
    Then I must see Ruby news and articles list
    