class PostsController < ApplicationController
  before_action :correct_user, only: :destroy

  def index
    if current_user.role == "admin" or current_user.role == "user_manager"
      @posts = Post.all
    else
      @posts = current_user.posts
    end
  end

  def new
    @post = Post.new
  end

  def show
      @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "This post was deleted"
    redirect_to posts_path, status: :see_other
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end

  def filter_by_date
    @date_start= params[:user][]
  end

  private

  def post_params
    params.require(:post).permit(:date, :distance, :time)
  end
end
