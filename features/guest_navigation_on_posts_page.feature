Feature: Guest navigation on Posts page

  In order to Posts page
  As a guest user
  I need to have access to the next resources
  
  Scenario: guest opens post by post title
    Given I am a guest user
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Posts post link
    Then I must see post details
    
  Scenario: guest opens post by Show link
    Given I am a guest user
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Show link
    Then I must see post details
    
  Scenario: guest must not see Edit link
    Given I am a guest user
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Show link
    Then I must not see Edit link
    
  Scenario: guest must not see Destroy link
    Given I am a guest user
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Show link
    Then I must not see Destroy link
    
  Scenario: guest uses Back link
    Given I am a guest user
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Show link
    And I click on Back link
    Then I must see Posts page