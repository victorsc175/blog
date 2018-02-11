Feature: Log in user

  In order to Log in
  As a guest
  I need to have ability to be logged in
  
    Scenario: log in
      Given I am a guest user
      When I have user account created
      And I go to the Home page
      And I click on Log in link
      And I fill in credentials
      Then I get user logged in
      
    Scenario: log in with incorrect parameters
      Given I am a guest user
      When I have user account created
      And I go to the Home page
      And I click on Log in link
      And I fill in credentials with wrong details
      Then I should stay on Log in page
      
    Scenario: user must see Forgot your password? link
      Given I am a guest user
      When I have user account created
      And I go to the Home page
      And I click on Log in link
      And I click on Forgot your password? link
      Then I must see Forgot your password? page
      
    Scenario: user must see Sign in with GitHub link
      Given I am a guest user
      When I have user account created
      And I go to the Home page
      And I click on Log in link
      Then I must see Sign in with GitHub link
      