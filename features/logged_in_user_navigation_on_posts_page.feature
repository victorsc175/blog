Feature: Logged in user navigation on Posts page

  In order to Posts page
  As a logged in user
  I need to have access to the next resources
  
  Scenario: logged in user opens post by post title
    Given I am a logged in user
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Posts post link
    Then I must see post details
    
  Scenario: logged in user opens post by Show link
    Given I am a logged in user
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Show link
    Then I must see post details
    
  Scenario: logged in user must not see Edit link
    Given I am a logged in user
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Show link
    Then I must not see Edit link
    
  Scenario: logged in user must not see Destroy link
    Given I am a logged in user
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Show link
    Then I must not see Destroy link
    
  Scenario: logged in user uses Back link
    Given I am a logged in user
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Show link
    And I click on Back link
    Then I must see Posts page