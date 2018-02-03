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

  scenario 'Log in with correct parameters' do
    visit('/')
    click_link('Register')
    fill_in('Name', with: 'John Smith')
    fill_in('Email', with: 'john.smith@mail.com')
    fill_in('Password', with: 'manager')
    fill_in('Password confirmation', with: 'manager')
    click_button('Sign up')
    click_link('Log out')
    click_link('Log in')
    fill_in('Email', with: 'john.smith@mail.com')
    fill_in('Password', with: 'manager')
    click_button('Log in')
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'Log in with incorrect email' do
    visit('/')
    click_link('Register')
    fill_in('Name', with: 'John Smith')
    fill_in('Email', with: 'john.smith@mail.com')
    fill_in('Password', with: 'manager')
    fill_in('Password confirmation', with: 'manager')
    click_button('Sign up')
    click_link('Log out')
    click_link('Log in')
    fill_in('Email', with: '')
    fill_in('Password', with: 'manager')
    click_button('Log in')
    expect(page).to have_content('Email')
  end

  scenario 'Log in with incorrect password' do
    visit('/')
    click_link('Register')
    fill_in('Name', with: 'John Smith')
    fill_in('Email', with: 'john.smith@mail.com')
    fill_in('Password', with: 'manager')
    fill_in('Password confirmation', with: 'manager')
    click_button('Sign up')
    click_link('Log out')
    click_link('Log in')
    fill_in('Email', with: 'john.smith@mail.com')
    fill_in('Password', with: 'mana')
    click_button('Log in')
    expect(page).to have_content('Password')
  end

  scenario 'Log out' do
    visit('/')
    click_link('Register')
    fill_in('Name', with: 'John Smith')
    fill_in('Email', with: 'john.smith@mail.com')
    fill_in('Password', with: 'manager')
    fill_in('Password confirmation', with: 'manager')
    click_button('Sign up')
    click_link('Log out')
    expect(page).to have_content('Signed out successfully.')
  end
end
