module  PostHelper
  def create_post
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:post, user: user)
  end
end