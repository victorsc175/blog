include PostHelper

When('I go to the Home page') do
  visit('/')
end

Then('I must see Latest News list') do
  expect(page).to have_content('Latest News')
end

When('I click on Home link') do
  click_link 'Home'
end

Then('I must see About Us information') do
  expect(page).to have_content('About Us')
end

When('I click on About link') do
  click_link 'About'
end

When("I click on Posts link") do
  click_link 'Posts'
end

Then("I must see Posts list") do
  expect(page).to have_content('Listing posts')
end

When("I click on Register link") do
  click_link 'Register'
end

Then("I must see Sign up form") do
  expect(page).to have_content('Sign up')
end

When("I click on post link") do
  click_link Post.first.title
end

Then("I must see post details") do
  expect(page).to have_content('Comments')
end

When("I click on Log in link") do
  click_link 'Log in'
end

Then("I must see Log in form") do
  expect(page).to have_content('Email')
end

When("I click on Back link") do
  click_link 'Back'
end

Then("I must see Posts page") do
  expect(page).to have_content('Listing posts')
end

When("I click on Show link") do
  click_link 'Show'
end

When("I click on Posts post link") do
  click_link Post.first.title
end

Then("I must not see Users link") do
  expect(page).not_to have_content('Users')
end

Then("I must not see New Post link") do
  expect(page).not_to have_content('New Post')
end

Then("I must not see Edit link") do
  expect(page).not_to have_content('Edit')
end

Then("I must not see Destroy link") do
  expect(page).not_to have_content('Destroy')
end

Then("I must not see Log in link") do
  expect(page).not_to have_content('Log in')
end

When("I click on New Post link") do
  click_link 'New Post'
end

Then("I must see Create Post button") do
  expect(page).to have_content('Create Post')
end

When("I click on Users link") do
  click_link 'Users'
end

Then("I must see users list") do
  expect(page).to have_content('Listing users')
end

When("I click on Profile link") do
  click_link 'Profile'
end

Then("I must see Edit Profile form") do
  expect(page).to have_content('Edit Profile')
end

When("I click on Log out link") do
  click_link 'Log out'
end

Then("I must be signed out") do
  expect(page).to have_content('Signed out successfully.')
end

When("I click on Edit link") do
  click_link 'Edit'
end

Then("I must see edit post form") do
  expect(page).to have_content('Editing post')
end

Then("I must see Destroy link") do
  expect(page).to have_content('Destroy')
end

When("posts exist") do
  create_post
end