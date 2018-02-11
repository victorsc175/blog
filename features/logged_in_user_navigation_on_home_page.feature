Feature: Logged in user navigation on Home page

  In order to use application
  As a logged in user
  I need to have access to the next resources
  
  Scenario: logged in user goes to Home page
    Given I am a logged in user
    When I go to the Home page
    And I click on Home link
    Then I must see Latest News list
    
  Scenario: logged in user goes to Posts page
    Given I am a logged in user
    When I go to the Home page
    And I click on Posts link
    Then I must see Posts list
    
  Scenario: logged in user goes to About page
    Given I am a logged in user
    When I go to the Home page
    And I click on About link
    Then I must see About Us information
    
  Scenario: logged in user opens post
    Given I am a logged in user
    And posts exist
    And I go to the Home page
    And I click on post link
    Then I must see post details
    
  Scenario: logged in user opens Profile
    Given I am a logged in user
    When I go to the Home page
    And I click on Profile link
    Then I must see Edit Profile form
    
  Scenario: logged in user log out
    Given I am a logged in user
    When I go to the Home page
    And I click on Log out link
    Then I must be signed out
    
  Scenario: logged in user must not see Users link  
    Given I am a logged in user
    When I go to the Home page
    Then I must not see Users link
    
  Scenario: logged in user must not see Log in link  
    Given I am a logged in user
    When I go to the Home page
    Then I must not see Log in link
    
  Scenario: logged in user must not see Edit post link  
    Given I am a logged in user
    When I go to the Home page
    And I click on Posts link
    Then I must not see Edit link
    
  Scenario: logged in user must not see Destroy post link  
    Given I am a logged in user
    When I go to the Home page
    And I click on Posts link
    Then I must not see Destroy link