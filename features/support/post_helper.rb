# Post helper
module PostHelper
  def create_post
    user = User.first || FactoryGirl.create(:user)
    FactoryGirl.create(:post, user: user)
  end

  def fill_in_post
    fill_in('Title', with: 'New Post Title')
    fill_in('Body', with: 'NewPost Body')
    click_button('Create Post')
  end

  def fill_in_incorrect_post
    fill_in('Title', with: '')
    fill_in('Body', with: '')
    click_button('Create Post')
  end
end
