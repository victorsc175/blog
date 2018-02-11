Feature: moderator navigation on Users page

  In order to use Users page
  As a moderator
  I need to have access to the next resources
  
  Scenario: moderator opens show user page
    Given I am a moderator
    When I click on Users link
    And I click on user email link
    Then I must see user show page
    
  Scenario: moderator opens show user page
    Given I am a moderator
    When I click on Users link
    And I click on Show link
    Then I must see user show page
    
  Scenario: moderator opens edit user page
    Given I am a moderator
    When I click on Users link
    And I click on Edit link
    Then I must see edit user page
    
  Scenario: moderator must see Destroy link
    Given I am a moderator
    When I click on Users link
    Then I must see Destroy link
