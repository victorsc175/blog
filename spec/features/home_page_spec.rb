require 'rails_helper'

feature 'Home page' do
  scenario 'Show home page' do
    visit('/')
    expect(page).to have_content('Ruby news and articles')
  end
end
