require 'rails_helper'

RSpec.describe 'home/index.html.slim', type: :view do
  let(:user1) { FactoryGirl.create(:user, name: 'Posted User1', email: 'posted1@email.com') }
  let(:user2) { FactoryGirl.create(:user, name: 'Posted User2', email: 'posted2@email.com') }
  before(:each) do
    user = creator
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
    Post.create!(
      title: 'Title1',
      body: 'MyText',
      user: user1,
      disactive: false
    )
    Post.create!(
      title: 'Title2',
      body: 'MyText',
      user: user2,
      disactive: false
    )
    Post.create!(
      title: 'Title3',
      body: 'MyText',
      user: user1,
      disactive: false
    )
    assign(:posts, Post.includes(:user).page(1).per(10))
  end

  it 'renders a list of posts' do
    render
    assert_select 'a', text: 'Title1'.to_s, count: 1
    assert_select 'a', text: 'Title2'.to_s, count: 1
    assert_select 'p', text: 'MyText'.to_s, count: 3
  end
end
