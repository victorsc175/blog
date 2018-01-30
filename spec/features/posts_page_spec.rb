require 'rails_helper'

feature 'Listing posts page' do
  scenario 'Show posts page' do
    visit('/posts')
    expect(page).to have_content('Listing posts')
  end

  scenario 'Visit Listing posts page' do
    visit('/')
    click_link 'Posts'
    expect(page).to have_content('Listing posts')
  end
end