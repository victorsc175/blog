require 'rails_helper'

feature 'New Post page' do
  scenario 'Show New Post in page' do
    visit('/posts/new')
    expect(page).to have_content('New post')
  end

  scenario 'Visit New Post page' do
    visit('/')
    click_link 'New Post'
    expect(page).to have_content('New post')
  end
end