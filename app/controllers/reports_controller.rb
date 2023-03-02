class ReportsController < ApplicationController
  def weekly_averages

    values = current_user.posts.order(Arel.sql("DATE_TRUNC('week', date) ASC"))

    # Group values by week and calculate the total time and distance for each week
    @weekly_totals = values.group_by { |v| v.date&.strftime("%U") }.map do |week, entries|
      {
        week: week,
        total_distance: (entries.sum(&:distance)).to_f/entries.length,
        total_time: (entries.sum{|entry| entry.time.to_f})/entries.length
      }
    end
  end
end
