# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Example User",
             age: rand(18..50),
             gender: "Male",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               age: rand(18..50),
               gender: "Female",
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

66.times do |n|
  areas = %w{Height Downtown Mission Sunset Richmond Marina}
  words = %w{Spacious Luxury Renovated Bright Large}
  desc = Faker::Lorem.paragraph(rand(2..7))
  Room.create(neighborhood: areas[rand(0..5)],
              short_desc: "#{words[rand(0..4)]} room for rent.",
              price: rand(800..2750), 
              description: desc,
              user_id: rand(1..10))
end 
