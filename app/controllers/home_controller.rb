# Blog start page
class HomeController < ApplicationController
  def index
    @posts = Post.published.order(created_at: :desc).includes(:user).limit(10)
  end

  def about; end
end
