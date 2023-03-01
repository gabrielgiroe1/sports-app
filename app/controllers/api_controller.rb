class ApiController < ApplicationController
  before_action :authenticate_api_v1_user!
  skip_before_action :verify_authenticity_token, only: [:create]

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :email, :phone_number, :password])
  end
end