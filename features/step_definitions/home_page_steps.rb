Given('I am a guest user') do
  # default
end

When('I go to the Home page') do
  visit('/')
end

Then('I must see Latest News list') do
  expect(page).to have_content('Latest News')
end

When('I click on Home page link') do
  click_link 'Home'
end
