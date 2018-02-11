Feature: Guest navigation on post page

  In order to post page
  As a guest user
  I need to have access to the next resources
  
  Scenario: guest uses Back link
    Given I am a guest user
    And posts exist
    When I go to the Home page
    And I click on post link
    And I click on Back link
    Then I must see Posts page