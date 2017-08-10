# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  Request.create({
  name: "Volunteer Work #{i+1}",
  date: :today,
  start_time: "08:30",
  end_time: "10:30",
  address: "8 Claymore Hill, Singapore 229572",
  area: "Orchard",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  image: "https://static.independent.co.uk/s3fs-public/styles/article_small/public/thumbnails/image/2013/08/19/10/volunteering.jpg",
  opening: "5",
  unit_time_credit: "10",
  created_by: "1"
  })
end

5.times do |i|
  Reward.create({
  name: "Yoga Class #{i+1}",
  date: :today,
  start_time: "18:30",
  end_time: "20:30",
  address: "8 Claymore Hill, Singapore 229572",
  area: "Orchard",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  image: "https://static1.squarespace.com/static/561080bfe4b0827aaf02c999/t/561a4041e4b0dfaa034e562d/1444561223508/Yoga+class.jpg?format=1500w",
  opening: "5",
  unit_time_credit: "10",
  created_by: "2"
  })
end

5.times do |i|
  Account.create({
  account_type: "individual",
  name: "admin#{i+1}",
  tel: "12345678",
  identification: "S1234567A",
  profile_image: "https://s-media-cache-ak0.pinimg.com/736x/07/dd/12/07dd1283d19211a46dbbb29ec4483fe8--drawings-faces-girl-art-drawings.jpg",
  time_credit: "100",
  email: "admin#{i}@gmail.com",
  password: "12345678"
  })
end
