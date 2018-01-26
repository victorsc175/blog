require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
      User.create!(
        :name => "Name1",
        :email => "mail5@mail.com",
        :moderator => false,
        :creator => false,
        :disactive => false,
        :comments_count => 2,
        :posts_count => 3
      )
      User.create!(
        :name => "Name2",
        :email => "mail6@mail.com",
        :moderator => false,
        :creator => false,
        :disactive => false,
        :comments_count => 2,
        :posts_count => 3
      )
    assign(:users, User.page(1).per(10))
  end

  it "renders a list of users" do
    render
    assert_select "p", :text => "Name1".to_s, :count => 1
    assert_select "p", :text => "Name2".to_s, :count => 1
    assert_select "a", :text => "mail5@mail.com".to_s, :count => 1
    assert_select "a", :text => "mail6@mail.com".to_s, :count => 1
    assert_select "p", :text => "active".to_s, :count => 2
    # assert_select "tr>td", :text => 2.to_s, :count => 2
    # assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
