class Api::V1::HomeController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end
end
