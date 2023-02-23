class ReportsController < ApplicationController
  def weekly_averages
    @weekly_averages = Post.weekly_averages
  end
end
