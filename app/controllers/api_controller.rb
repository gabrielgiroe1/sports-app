class ApiController < ApplicationController
  before_action :authenticate_api_v1_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :email, :phone_number, :password])
  end
end