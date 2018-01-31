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
  
  scenario 'Sign up with correct parameters' do
    visit('/')
    click_link('Register')
    fill_in('Name', :with => 'John Smith')
    fill_in('Email', :with => 'john.smith@mail.com')
    fill_in('Password', :with => 'manager')
    fill_in('Password confirmation', :with => 'manager')
    click_button('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
  
  scenario 'Sign up with empty name' do
    visit('/')
    click_link('Register')
    fill_in('Name', :with => '')
    fill_in('Email', :with => 'john.test@mail.com')
    fill_in('Password', :with => 'manager')
    fill_in('Password confirmation', :with => 'manager')
    click_button('Sign up')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content('Name is too short (minimum is 2 characters)')
  end
  
  scenario 'Sign up with empty email' do
    visit('/')
    click_link('Register')
    fill_in('Name', :with => 'John Test')
    fill_in('Email', :with => '')
    fill_in('Password', :with => 'manager')
    fill_in('Password confirmation', :with => 'manager')
    click_button('Sign up')
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content('Email Invalid email')
  end
  
  scenario 'Sign up with incorrect email' do
    visit('/')
    click_link('Register')
    fill_in('Name', :with => 'John Test')
    fill_in('Email', :with => 'john.testmail.com')
    fill_in('Password', :with => 'manager')
    fill_in('Password confirmation', :with => 'manager')
    click_button('Sign up')
    expect(page).to have_content('Email Invalid email')
  end
  
  scenario 'Sign up with empty password' do
    visit('/')
    click_link('Register')
    fill_in('Name', :with => 'John Test')
    fill_in('Email', :with => 'john.test@mail.com')
    fill_in('Password', :with => '')
    fill_in('Password confirmation', :with => '')
    click_button('Sign up')
    expect(page).to have_content("Password can't be blank")
  end
  
  scenario 'Sign up with incorrect password' do
    visit('/')
    click_link('Register')
    fill_in('Name', :with => 'John Test')
    fill_in('Email', :with => 'john.test@mail.com')
    fill_in('Password', :with => 'mana')
    fill_in('Password confirmation', :with => '')
    click_button('Sign up')
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end
end