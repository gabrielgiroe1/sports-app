class Api::V1::ReportsController < ApplicationController
  respond_to :json
  def weekly_averages
    @weekly_averages = current_user.posts.weekly_averages
  end
end
