module PostsHelper
  def average_speed(post_distance, post_time)
    (post_distance.to_i * 1000) / (post_time.to_i*60).round(2)
  end

end
