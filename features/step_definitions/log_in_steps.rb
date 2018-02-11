When("I have user account created") do
  FactoryGirl.create(:user) unless User.first
end

When("I fill in credentials") do
  user = User.first
  fill_in('Email', with: user.email)
  fill_in('Password', with: 'specmanager')
  click_button('Log in')
end

Then("I get user logged in") do
  expect(page).to have_content('Signed in successfully.')
end

When("I fill in credentials with wrong details") do
  fill_in('Email', with: '')
  fill_in('Password', with: '')
  click_button('Log in')
end

Then("I should stay on Log in page") do
  expect(page).to have_content('Password')
end

When("I click on Forgot your password? link") do
  click_link 'Forgot your password?'
end

Then("I must see Forgot your password? page") do
  expect(page).to have_button('Send me reset password instructions')
end

Then("I must see Sign in with GitHub link") do
  expect(page).to have_content('Sign in with GitHub')
end