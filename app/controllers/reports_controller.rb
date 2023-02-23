class ReportsController < ApplicationController
  def weekly_averages
    @weekly_averages = current_user.posts.weekly_averages
  end
end
