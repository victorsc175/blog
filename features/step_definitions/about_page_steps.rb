When('I go to the About page') do
  visit('/about')
end

Then('I must see About Us information') do
  expect(page).to have_content('About Us')
end

When('I click on About page link') do
  click_link 'About'
end
