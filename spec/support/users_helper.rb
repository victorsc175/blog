require 'rails_helper'

module  UserHelper
  def signup
    visit root_path
    click_link('Register')
    fill_in('Name', with: 'John Smith')
    fill_in('Email', with: 'john.smith@mail.com')
    fill_in('Password', with: 'manager')
    fill_in('Password confirmation', with: 'manager')
    click_button('Sign up')
  end

  def login(email, password)
    visit root_path
    click_link('Log in')
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    click_button('Log in')
  end

  def logout
    visit root_path
    click_link('Log out')
  end

  def moderator
    FactoryGirl.create(:user, name: 'Posted User',
                              email: 'posted@email.com',
                              password: 'specmanager',
                              creator: true,
                              moderator: true)
  end

  def creator
    FactoryGirl.create(:user, name: 'Posted User',
                              email: 'posted@email.com',
                              password: 'specmanager',
                              creator: true,
                              moderator: false)
  end
end
