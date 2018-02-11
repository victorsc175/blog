Feature: moderator navigation on Posts page

  In order to Posts page
  As a moderator
  I need to have access to the next resources
  
  Scenario: moderator opens post by post title
    Given I am a moderator
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Posts post link
    Then I must see post details
    
  Scenario: moderator opens post by Show link
    Given I am a moderator
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Show link
    Then I must see post details
    
  Scenario: moderator edits post
    Given I am a moderator
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Edit link
    Then I must see edit post form
    
  Scenario: moderator must see Destroy link
    Given I am a moderator
    When I go to the Home page
    And posts exist
    And I click on Posts link
    Then I must see Destroy link
    
  Scenario: moderator uses Back link
    Given I am a moderator
    When I go to the Home page
    And posts exist
    And I click on Posts link
    And I click on Show link
    And I click on Back link
    Then I must see Posts page