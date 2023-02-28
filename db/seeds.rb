# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "cloudinary"
require "open-uri"

puts "Getting those amazing grandmas"
puts "Hold on"
Grandma.destroy_all
20.times do
  User.create!(
    email: Faker::Internet.email,
    password: '123456'
  )
end
file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
20.times do
grandma = Grandma.create!(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    location: Faker::Address.full_address,
    skills: Faker::Hobby.activity,
    image_url: Faker::Avatar.image,
    user_id: User.all.sample.id
  )
end
