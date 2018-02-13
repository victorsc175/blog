When('I fill in post details') do
  fill_in_post
end

Then('I get new post created') do
  expect(page).to have_content('Post was successfully created')
end

When('I fill in post with wrong parameters') do
  fill_in_incorrect_post
end

Then('I get new post create error') do
  expect(page).to have_content('errors prohibited this post from being saved')
end
