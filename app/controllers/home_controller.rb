# Blog start page
class HomeController < ApplicationController
  def index
    @posts = Post.includes(:user).page(params[:page]).per(10)
  end

  def about; end
end
