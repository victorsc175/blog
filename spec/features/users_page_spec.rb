require 'rails_helper'

feature 'Listing users page' do
  before :each do
    user = moderator
    login(user.email, 'specmanager')
  end

  scenario 'Show users page' do
    visit('/users')
    expect(page).to have_content('Listing users')
  end

  scenario 'Visit Listing users page' do
    visit('/')
    click_link 'Users'
    expect(page).to have_content('Listing users')
  end

  scenario 'Show user' do
    visit('/')
    click_link 'Users'
    click_link 'john.smith@mail.com'
    expect(page).to have_content('Back')
  end

  scenario 'Edit user' do
    visit('/')
    click_link 'Users'
    click_link 'john.smith@mail.com'
    click_link('Edit')
    fill_in('Name', with: 'John White')
    click_button('Update User')
    expect(page).to have_content('User was successfully updated.')
  end

  scenario 'Edit post with incorrect parameters' do
    visit('/')
    click_link 'Users'
    click_link 'john.smith@mail.com'
    click_link('Edit')
    fill_in('Name', with: '')
    fill_in('Email', with: '')
    click_button('Update User')
    expect(page).to have_content('Email can\'t be blank')
    expect(page).to have_content('Email Invalid email')
    expect(page).to have_content('Name can\'t be blank')
    expect(page).to have_content('Name is too short (minimum is 2 characters)')
  end
end
