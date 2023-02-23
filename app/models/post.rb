class Post < ApplicationRecord
  belongs_to :user
  validates :time, presence: true
  scope :weekly_averages, -> {
    select("datetime('week', date) as week, avg(distance) as avg_distance, avg(distance / time) as avg_speed")
      .group("datetime('week', date)")
  }
end
