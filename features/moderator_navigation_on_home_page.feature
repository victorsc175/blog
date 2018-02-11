Feature: Moderator navigation on Home page

  In order to use application
  As a moderator
  I need to have access to the next resources
  
  Scenario: moderator goes to Home page
    Given I am a moderator
    When I go to the Home page
    And I click on Home link
    Then I must see Latest News list
    
  Scenario: moderator goes to Posts page
    Given I am a moderator
    When I go to the Home page
    And I click on Posts link
    Then I must see Posts list
    
  Scenario: moderator goes to About page
    Given I am a moderator
    When I go to the Home page
    And I click on About link
    Then I must see About Us information
    
  Scenario: moderator opens post
    Given I am a moderator
    When posts exist
    And I go to the Home page
    And I click on post link
    Then I must see post details
    
  Scenario: moderator goes to Users page
    Given I am a moderator
    When I go to the Home page
    And I click on Users link
    Then I must see users list
    
  Scenario: moderator must not see Log in link  
    Given I am a moderator
    When I go to the Home page
    Then I must not see Log in link