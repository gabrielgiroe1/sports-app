class Api::V1::UsersController < ApiController
  include RackSessionFix
  skip_before_action :verify_authenticity_token, only: [:create]
  respond_to :json
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
     render json: @user
  end

  def create
    @user= User.new(user_params)
    if @user.save
      render json: @user, status: :created
      # flash[:success]= "User was created"
      # redirect_to api_v1_users_path
    else
      render json: {errors: @user.errors.full_message}, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user&.valid_password?(params[:password])
      token = JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base)
      render json: { token: token }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end


  def destroy
    current_user.update(authentication_token: nil)
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:email, :full_name, :phone_number, :password, :password_confirmation)
  end
end
