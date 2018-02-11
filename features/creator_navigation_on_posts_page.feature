Feature: creator navigation on Posts page

  In order to Posts page
  As a creator
  I need to have access to the next resources
  
  Scenario: creator opens post by post title
    Given I am a creator
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Posts post link
    Then I must see post details
    
  Scenario: creator opens post by Show link
    Given I am a creator
    When posts exist
    And I go to the Home page
    And I click on Posts link
    And I click on Show link
    Then I must see post details
    
  Scenario: creator must not see Edit link
    Given I am a creator
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Show link
    Then I must not see Edit link
    
  Scenario: creator must not see Destroy link
    Given I am a creator
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Show link
    Then I must not see Destroy link
    
  Scenario: creator uses Back link
    Given I am a creator
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Show link
    And I click on Back link
    Then I must see Posts page