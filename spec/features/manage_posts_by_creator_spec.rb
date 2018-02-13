require 'rails_helper'

feature 'Listing posts page' do
  before :each do
    user = creator
    login(user.email, 'specmanager')
  end

  scenario 'Show posts page' do
    visit('/posts')
    expect(page).to have_content('Listing posts')
  end

  scenario 'Visit Listing posts page' do
    click_link 'Posts'
    expect(page).to have_content('Listing posts')
  end

  scenario 'Create new post' do
    click_link 'New Post'
    fill_in('Title', with: 'Test Post')
    fill_in('Body', with: 'Test Post body')
    click_button('Create Post')
    expect(page).to have_content('Post was successfully created.')
  end

  scenario 'Create new post with incorrect parameters' do
    click_link 'New Post'
    fill_in('Title', with: '')
    fill_in('Body', with: '')
    click_button('Create Post')
    expect(page).to have_content('Title can\'t be blank')
    expect(page).to have_content('Title is too short (minimum is 2 characters)')
    expect(page).to have_content('Body can\'t be blank')
  end

  scenario 'Show post' do
    click_link 'New Post'
    fill_in('Title', with: 'Test Post')
    fill_in('Body', with: 'Test Post body')
    click_button('Create Post')
    click_link('Test Post')
    expect(page).to have_content('Back')
  end
end
