module PostsHelper
  def average_speed(post_distance, post_time)
    ((post_distance.to_i * 1000) / (post_time.hour * 360 + post_time.min * 60 +
      post_time.sec)) * 0.36
  end

  def filter_by_date(start_date, end_date)
    @posts = User.where("created_at between (?) and (?)", start_date, end_date)
  end
end
