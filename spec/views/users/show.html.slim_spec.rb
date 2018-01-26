require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            name: 'Name',
                            email: 'mail@email.com',
                            moderator: false,
                            creator: false,
                            disactive: false,
                            comments_count: 2,
                            posts_count: 3
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
