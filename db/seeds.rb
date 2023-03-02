require 'faker'
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
  # PROFILE PIC
  rand_num = rand(2..8)
  file = URI.open("app/assets/images/profile/#{rand_num}- FEED.png")
    grandma.image_url.attach(io: file, filename: "#{rand_num}.png", content_type: "image/png")

  # FEED

    2.times do
      rand_num = rand(2..8)
      file = URI.open("app/assets/images/feed/#{rand_num}- FEED.jpg")
      grandma.feed_photos.attach(io: file, filename: "#{rand_num}.jpg", content_type: "image/jpg")
    end
end
