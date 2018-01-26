require 'rails_helper'

RSpec.describe 'posts/edit', type: :view do
  let(:user) { FactoryGirl.create(:user, name: 'Posted User', email: 'posted@email.com') }

  before(:each) do
    @post = assign(:post, Post.create!(
                            title: 'MyString',
                            body: 'MyText',
                            user: user,
                            disactive: false
    ))
  end

  it 'renders the edit post form' do
    render

    assert_select 'form[action=?][method=?]', post_path(@post), 'post' do
      assert_select 'input[name=?]', 'post[title]'

      assert_select 'textarea[name=?]', 'post[body]'

      assert_select 'input[name=?]', 'post[disactive]'
    end
  end
end
