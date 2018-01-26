require 'rails_helper'

RSpec.describe 'posts/show', type: :view do
  let(:user) { FactoryGirl.create(:user, name: 'Posted User3', email: 'posted3@email.com') }
  before(:each) do
    @post = assign(:post, Post.create!(
                            title: 'Title',
                            body: 'MyText',
                            user: user,
                            disactive: false
    ))
    @comments = assign(:comments, Post.first.comments.includes(:user).page(1).per(10))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
