require 'rails_helper'

feature 'Manage posts by guest' do

  scenario 'Show posts page' do
    visit('/posts')
    expect(page).to have_content('Listing posts')
  end

  scenario 'Visit Listing posts page' do
    visit home_path
    click_link 'Posts'
    expect(page).to have_content('Listing posts')
  end

end
