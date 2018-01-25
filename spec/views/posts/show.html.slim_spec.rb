require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  let(:user) { FactoryGirl.create(:user, name: 'Posted User3', email: 'posted3@email.com') }
  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "Title",
      :body => "MyText",
      :user => user,
      :disactive => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
