Feature: About page

  In order to read About page
  As a guest user
  I want to see About Us information
  
  Scenario: guest user sees About page
    Given I am a guest user
    When I go to the About page
    Then I must see About Us information
  
  Scenario: guest user goes to About page
    Given I am a guest user
    When I go to the Home page
    And I click on About page link
    Then I must see About Us information