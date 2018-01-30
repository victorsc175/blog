require 'rails_helper'

feature 'Register page' do
  scenario 'Show Register page' do
    visit('/users/sign_up')
    expect(page).to have_content('Sign up')
  end

  scenario 'Visit Register page' do
    visit('/')
    click_link 'Register'
    expect(page).to have_content('Sign up')
  end
end