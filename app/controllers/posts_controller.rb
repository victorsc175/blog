require_relative '../policies/post_policy'
# Post class
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.published.includes(:user).page(params[:page]).per(10)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = @post.comments.includes(:user)
                     .order(:created_at)
                     .page(params[:page]).per(10)
  end

  # GET /posts/new
  def new
    @post = Post.new
    authorize @post
  end

  # GET /posts/1/edit
  def edit
    authorize @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    respond_to do |format|
      output_for_create(format)
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize @post
    respond_to do |format|
      output_for_update(format)
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html do
        redirect_to posts_url,
                    notice: 'Post was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :body, :user_id, :disactive)
  end

  def output_for_create(format)
    if @post.save
      if request.xhr?
        format.json { render :show, status: :created, location: @post }
      else
        format.html do
          redirect_to @post,
                      notice: 'Post was successfully created.'
        end
      end
    else
      if request.xhr?
        format.json do
          render json: @post.errors,
                 status: :unprocessable_entity
        end
      else
        format.html { render :new }
      end
    end
  end

  def output_for_update(format)
    if @post.update(post_params)
      format.html do
        redirect_to @post,
                    notice: 'Post was successfully updated.'
      end
      format.json { render :show, status: :ok, location: @post }
    else
      format.html { render :edit }
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end
end
