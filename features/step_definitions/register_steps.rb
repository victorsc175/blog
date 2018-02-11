When("I fill in sign up details") do
  fill_in('Name', with: 'new_user')
  fill_in('Email', with: 'new_user@email.com')
  fill_in('Password', with: 'temppassword')
  fill_in('Password confirmation', with: 'temppassword')
  click_button('Sign up')
end

Then("I get new user registered") do
  expect(page).to have_content('Welcome! You have signed up successfully.')
end

When("I fill in sign up with wrong details") do
  fill_in('Name', with: 'new_user')
  fill_in('Email', with: '')
  fill_in('Password', with: 'temppassword')
  fill_in('Password confirmation', with: 'temppassword')
  click_button('Sign up')
end

Then("I get user registration error") do
  expect(page).to have_content('errors prohibited this user from being saved')
end
