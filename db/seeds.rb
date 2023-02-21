# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

9.times do |n|
  User.create!(email: "user#{n}@gmail.com", full_name: "user #{n}", phone_number: "073512312#{n}", role: "user", password: "123123")
end

users=User.order(:created_at).take(10)

9.times do |n|
  date = Faker::Date.between(from: '2023-01-01', to: '2023-02-28')
  users.each { |user| user.posts.create!(date: date, distance: rand(1..10), time: "00:20:00") }
end