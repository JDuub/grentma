require 'faker'
require 'cloudinary'

puts 'Getting those amazing grandmas...'
puts 'Hold on...'

Grandma.destroy_all
20.times do
  User.create!(
    email: Faker::Internet.email,
    password: '123456'
  )
end

# Create the grandmas with random image URLs and feed photos
10.times do
  # Generate a random image URL for the grandma

  # Create the grandma with the random image and feed ph1oto URLs
  grandma = Grandma.create!(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    location: Faker::Address.full_address,
    skills: Faker::Hobby.activity,
    user_id: User.all.sample.id
  )
end
