require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "MyString",
      :email => "MyString",
      :moderator => false,
      :creator => false,
      :disactive => false,
      :comments_count => 1,
      :posts_count => 1
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[moderator]"

      assert_select "input[name=?]", "user[creator]"

      assert_select "input[name=?]", "user[disactive]"

      assert_select "input[name=?]", "user[comments_count]"

      assert_select "input[name=?]", "user[posts_count]"
    end
  end
end
