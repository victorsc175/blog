Feature: Guest navigation on Home page

  In order to use application
  As a guest user
  I need to have access to the next resources
  
  Scenario: guest goes to Home page
    Given I am a guest user
    When I go to the Home page
    And I click on Home link
    Then I must see Latest News list
    
  Scenario: guest goes to Posts page
    Given I am a guest user
    When I go to the Home page
    And I click on Posts link
    Then I must see Posts list
    
  Scenario: guest goes to About page
    Given I am a guest user
    When I go to the Home page
    And I click on About link
    Then I must see About Us information
    
  Scenario: guest goes to Register page
    Given I am a guest user
    When I go to the Home page
    And I click on Register link
    Then I must see Sign up form
    
  Scenario: guest opens post
    Given I am a guest user
    When I go to the Home page
    And I click on post link
    Then I must see post details
    
  Scenario: guest opens Log in page
    Given I am a guest user
    When I go to the Home page
    And I click on Log in link
    Then I must see Log in form
    
     