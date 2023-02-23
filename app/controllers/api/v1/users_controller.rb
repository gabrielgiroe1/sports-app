class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def new
    @user= User.new
    render json: @user
  end

  def edit
    @user= User.find(params[:id])
    render json: @user
  end

  def show
     @users = User.all
     render json: @users
  end

  def create
    @user= User.new(user_params)
    if @user.save
      render json: @user, status: :created
      flash[:success]= "User was created"
      redirect_to api_v1_users_path
    else
      render json: {errors: @user.errors.full_message}, status: :unprocessable_entity
      render
    end

  end

  def destroy
    @user= User.find(params[:id])
    @user.destroy
    if @user.destroy
      redirect_to api_v1_root_path, notice: "User deleted."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :full_name, :phone_number)
  end
end
