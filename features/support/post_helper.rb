module  PostHelper
  def create_post
    user = User.first || FactoryGirl.create(:user)
    FactoryGirl.create(:post, user: user)
  end
end