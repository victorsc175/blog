require 'rails_helper'

feature 'Login page' do
  scenario 'Show Log in page' do
    visit('/users/sign_in')
    expect(page).to have_content('Log in')
  end

  scenario 'Visit Log in page' do
    visit('/')
    click_link 'Log in'
    expect(page).to have_content('Log in')
  end
end