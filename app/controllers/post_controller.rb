class PostController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = user_signed_in? ? Post.sorted : Post.published.sorted
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(blog_post_params)
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(blog_post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def blog_post_params
    params.require(:post).permit(:title, :body, :published_at)
  end

  def set_blog_post
    @post = user_signed_in? ? Post.find(params[:id]) : @post = Post.published.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end
end
