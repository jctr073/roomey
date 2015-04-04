# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Read values from file into an array
areas = Array.new
file = 'db/neighborhoods.txt'
File.readlines(file).each do |line|
  areas << line.gsub(/\n/, "")
end

#Populate table with array values
areas.each do |nbrd|
  Neighborhood.create(city_id: "SFO",
                      name: nbrd)
end

hood_count = Neighborhood.count

User.create!(name:  "Example User",
             age: rand(18..50),
             gender: "Male",
             email: "example@railstutorial.org",
             price: 1800,
             phone: "(415) #{rand(100..999)}-#{rand(1000..9999)}",
             neighborhood_id: rand(1..hood_count),
             password: "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

200.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               age: rand(18..50),
               gender: "Female",
               neighborhood_id: rand(1..20),
               email: email,
               price: rand(800..3000),
               phone: "(415) #{rand(100..999)}-#{rand(1000..9999)}",
               neighborhood_id: rand(1..hood_count),
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

amtys = ['Close to muni', 'Private entrance', 'Dishwasher',
         'Washer/dryer in unit', 'Washer/dryer in building',
         'Balcony', 'Patio', 'High Speed Internet Access',
         'Fitness Center', 'On Site Management', 'Garage', 'Carport']
amtys.each do |a|
  Amenity.create(name: a)
end

#Create dummy room rentals
200.times do |n|
  words = %w{Spacious Luxury Renovated Bright Large}
  desc = Faker::Lorem.paragraph(rand(5..9))
  rm = Room.create(neighborhood_id: rand(1..hood_count),
              short_desc: "#{words[rand(0..4)]} room for rent.",
              price: rand(800..2750), 
              description: desc,
              size: rand(100..2000),
              user_id: rand(1..10))
  Amenity.all.each do |am|
    RoomAmenity.create(room_id: rm.id, amenity_id: am.id)
  end
end 


# def create_dummy_phone
#   "(415) #{rand(100..999)}-#{rand(1000..9999)}"
# end
