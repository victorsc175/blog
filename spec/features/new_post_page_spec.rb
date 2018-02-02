require 'rails_helper'
include UserHelper

feature 'New Post page' do
  
  before :each do
    user = creator
    login(user.email, 'specmanager')
  end
  
  scenario 'Show New Post in page' do
    visit('/posts/new')
    expect(page).to have_content('New post')
  end

  scenario 'Visit New Post page' do
    click_link 'New Post'
    expect(page).to have_content('New post')
  end
end