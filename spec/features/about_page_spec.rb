require 'rails_helper'

feature 'About page' do
  scenario 'Show About page' do
    visit('/about')
    expect(page).to have_content('About Us')
  end

  scenario 'Visit About page' do
    visit('/')
    click_link 'About'
    expect(page).to have_content('About Us')
  end
end
