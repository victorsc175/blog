require 'rails_helper'

feature 'Listing posts page' do
  
  before :each do
    visit('/')
    click_link('Register')
    fill_in('Name', :with => 'John Smith')
    fill_in('Email', :with => 'john.smith@mail.com')
    fill_in('Password', :with => 'manager')
    fill_in('Password confirmation', :with => 'manager')
    click_button('Sign up')
  end
  
  scenario 'Show posts page' do
    visit('/posts')
    expect(page).to have_content('Listing posts')
  end

  scenario 'Visit Listing posts page' do
    visit('/')
    click_link 'Posts'
    expect(page).to have_content('Listing posts')
  end
  
  scenario 'Create new post' do
    visit('/')
    click_link 'New Post'
    fill_in('Title', :with => 'Test Post')
    fill_in('Body', :with => 'Test Post body')
    click_button('Create Post')
    expect(page).to have_content('Post was successfully created.')
  end
  
  scenario 'Create new post with incorrect parameters' do
    visit('/')
    click_link 'New Post'
    fill_in('Title', :with => '')
    fill_in('Body', :with => '')
    click_button('Create Post')
    expect(page).to have_content('Title can\'t be blank')
    expect(page).to have_content('Title is too short (minimum is 2 characters)')
    expect(page).to have_content('Body can\'t be blank')
  end
  
  scenario 'Show post' do
    visit('/')
    click_link 'New Post'
    fill_in('Title', :with => 'Test Post')
    fill_in('Body', :with => 'Test Post body')
    click_button('Create Post')
    click_link('Test Post')
    expect(page).to have_content('Back')
  end
  
  scenario 'Edit post' do
    visit('/')
    click_link 'New Post'
    fill_in('Title', :with => 'Test Post')
    fill_in('Body', :with => 'Test Post body')
    click_button('Create Post')
    click_link('Test Post')
    click_link('Edit')
    fill_in('Title', :with => 'Test Post edited')
    click_button('Update Post')
    expect(page).to have_content('Post was successfully updated.')
  end
  
  scenario 'Edit post with incorrect parameters' do
    visit('/')
    click_link 'New Post'
    fill_in('Title', :with => 'Test Post')
    fill_in('Body', :with => 'Test Post body')
    click_button('Create Post')
    click_link('Test Post')
    click_link('Edit')
    fill_in('Title', :with => '')
    fill_in('Body', :with => '')
    click_button('Update Post')
    expect(page).to have_content('Title can\'t be blank')
    expect(page).to have_content('Title is too short (minimum is 2 characters)')
    expect(page).to have_content('Body can\'t be blank')
  end
end