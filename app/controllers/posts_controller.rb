class PostsController < ApplicationController
  before_action :correct_user, only: :destroy

  def index
    if current_user.admin? or current_user.user_manager?
      @posts = Post.all
      if params[:start_date] && params[:end_date]
        @posts = Post.where(date: params[:start_date]..params[:end_date])
      else
        @posts = Post.all
      end
    else
      if params[:start_date] && params[:end_date]
        @posts = current_user.posts.where(date: params[:start_date]..params[:end_date])
      else
        @posts = current_user.posts
      end
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

  private

  def post_params
    params.require(:post).permit(:date, :distance, :time)
  end
end
