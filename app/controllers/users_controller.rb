class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user= User.new
  end

  def edit
    @user= User.find(params[:id])
  end

  def show
     @users = User.all
  end

  def create
    @user= User.new(user_params)
    if @user.save
      flash[:success]= "User was created"
      redirect_to users_path
    else
      render
    end

  end

  def destroy
    @user= User.find(params[:id])
    @user.destroy
    if @user.destroy
      redirect_to root_url, notice: "User deleted."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :full_name, :phone_number)
  end
end
