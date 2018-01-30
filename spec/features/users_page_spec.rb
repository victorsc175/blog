require 'rails_helper'

feature 'Listing users page' do
  scenario 'Show users page' do
    visit('/users')
    expect(page).to have_content('Listing users')
  end

  scenario 'Visit Listing users page' do
    visit('/')
    click_link 'Users'
    expect(page).to have_content('Listing users')
  end
end