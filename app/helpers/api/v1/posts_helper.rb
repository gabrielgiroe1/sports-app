module Api::V1::PostsHelper
  def average_speed(post_distance, post_time)
    (((post_distance.to_i * 1000) / (post_time.hour * 360 + post_time.min * 60 +
      post_time.sec)) * 0.36).round(2)
  end

end
