Feature: Creator navigation on Home page

  In order to use application
  As a creator
  I need to have access to the next resources
  
  Scenario: creator goes to Home page
    Given I am a creator
    When I go to the Home page
    And I click on Home link
    Then I must see Latest News list
    
  Scenario: creator goes to Posts page
    Given I am a creator
    When I go to the Home page
    And I click on Posts link
    Then I must see Posts list
    
  Scenario: creator goes to About page
    Given I am a creator
    When I go to the Home page
    And I click on About link
    Then I must see About Us information
    
  Scenario: creator opens Profile
    Given I am a creator
    When I go to the Home page
    And I click on Profile link
    Then I must see Edit Profile form
    
  Scenario: creator log out
    Given I am a creator
    When I go to the Home page
    And I click on Log out link
    Then I must be signed out
    
  Scenario: creator opens post
    Given I am a creator
    And posts exist
    When I go to the Home page
    And I click on post link
    Then I must see post details
    
  Scenario: creator must not see Users link  
    Given I am a creator
    When I go to the Home page
    Then I must not see Users link
    
  Scenario: creator must not see Log in link  
    Given I am a creator
    When I go to the Home page
    Then I must not see Log in link
    
  Scenario: creator must not see Destroy post link  
    Given I am a creator
    When I go to the Home page
    And I click on Posts link
    Then I must not see Destroy link