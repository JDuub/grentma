# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

puts "Getting those amaying grandmas "
puts "Hold on"

Grandma.destroy_all

20.times do
  User.create!(
    email: Faker::Internet.email,
    password: '123456'
 )
  end

20.times do
Grandma.create!(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name ,
    location: Faker::Address.full_address,
    skills: Faker::Hobby.activity,
    image_url: Faker::Avatar.image,
    user_id: User.all.sample.id
  )
end
