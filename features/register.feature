Feature: Register user

  In order to register new user
  As a guest
  I need to have ability to be registered
  
    Scenario: registering
      Given I am a guest user
      When I go to the Home page
      And I click on Register link
      And I fill in sign up details
      Then I get new user registered
      
    Scenario: registering with incorrect parameters
      Given I am a guest user
      When I go to the Home page
      And I click on Register link
      And I fill in sign up with wrong details
      Then I get user registration error