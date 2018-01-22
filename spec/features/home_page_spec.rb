require 'rails_helper'

feature 'Home page' do
  scenario 'Show Home page' do
    visit('/')
    expect(page).to have_content('Latest News')
  end

  scenario 'Visit Home page' do
    visit('/about')
    click_link 'Home'
    expect(page).to have_content('Latest News')
  end
end
