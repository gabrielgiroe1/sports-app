class Api::V1::HomeController < ApplicationController
  respond_to :json
  def index
    @users = User.all
    render json: @users
  end
end
