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
  post = create_post
  visit '/'
  click_link post.title
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
  create_post
  visit '/'
  click_link 'Posts'
  click_link 'Show'
end

When("I click on Posts post link") do
  post = create_post
  visit '/'
  click_link 'Posts'
  click_link post.title
end