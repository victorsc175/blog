Feature: Creates new post

  In order to create new post
  As a creator
  I need to have ability to use next scenarios
  
    Scenario: create new post
      Given I am a creator
      When I go to the Home page
      And I click on New Post link
      And I fill in post details
      Then I get new post created
      
    Scenario: create new post with wrong parameters
      Given I am a creator
      When I go to the Home page
      And I click on New Post link
      And I fill in post with wrong parameters
      Then I get new post create error