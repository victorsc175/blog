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

  scenario 'Select post' do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    visit('/')
    click_link(post.title)
    expect(page).to have_content(post.body)
  end
end
