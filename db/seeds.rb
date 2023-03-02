require "faker"
require "cloudinary"
require "open-uri"



puts "Getting those amazing grandmas"
puts "Hold on"

addresses = ["Rudi-Dutschke-Straße 26, 10969 Berlin", "Hanns-Braun-Straße 2, 14053 Berlin", "Lindenstraße 9-14, 10969 Berlin", "Am Wriezener bhf, 10243 Berlin", "Cantianstraße 24, 10437 Berlin", "Eisenbahnstraße 42-43, 10997 Berlin", "Kopenhagener Str. 33, 13407 Berlin", "Immanuelkirchstraße 32, 10405 Berlin", "Windscheidstraße 26, 10627 Berlin", "Sangerhauser Weg 1, 12349 Berlin" ]
Grandma.destroy_all
User.destroy_all

2.times do
  User.create!(
    email: Faker::Internet.email,
    password: '123456'
  )
end

for i in 0...addresses.length do

  # PROFILE PIC

  # Create the grandma with the selected image and feed photos
  grandma = Grandma.create!(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    location: addresses[i],
    skills: Faker::Hobby.activity,
    user_id: User.all.sample.id
  )

  rand_num = rand(2..14)
  file = URI.open("app/assets/images/profile/#{rand_num}- feed.png")
  grandma.image_url.attach(io: file, filename: "#{rand_num}.png", content_type: "image/png")

  # FEED
    2.times do
      rand_num = rand(2..14)
      file = URI.open("app/assets/images/feed/#{rand_num}- feed.jpg")
      grandma.feed_photos.attach(io: file, filename: "#{rand_num}.jpg", content_type: "image/jpg")
    end
end 








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

addresses = ["Rudi-Dutschke-Straße 26, 10969 Berlin", "Hanns-Braun-Straße 2, 14053 Berlin", "An d. Wuhlheide 263, 12555 Berlin", "Am Wriezener bhf, 10243 Berlin", "Cantianstraße 24, 10437 Berlin"]


puts "Getting those amazing grandmas"
puts "Hold on"
Grandma.destroy_all
20.times do
  User.create!(
    email: Faker::Internet.email,
    password: '123456'
  )
end
# Get a list of images in the folder
# folder_name = 'Profile'
# images = Cloudinary::Api.resources(type: 'upload', prefix: "#{folder_name}/")['resources']
# used_images = []
# # Create the grandmas and assign a random image from the folder
# # Get a list of images for the feed photos
# feed_folder_name = 'feed'
# feed_images = Cloudinary::Api.resources(type: 'upload', prefix: "#{feed_folder_name}/")['resources']
# used_feed_images = []
# Create the grandmas and assign a random image from the folder and random feed photos
for i in 0...addresses.length do
  # Select a random image for the grandma
  # image = images.sample['url']
  # while used_images.include?(image)
  #   image = images.sample['url']
  # end
  # used_images << image
  # # Select three random feed photos for the grandma
  # feed_photos = []
  # feed_images = Cloudinary::Api.resources(type: 'upload', prefix: "#{feed_folder_name}/")['resources']
  # used_feed_photos = []
  # while feed_photos.length < 3
  #   feed_image = feed_images.sample['url']
  #   if !used_feed_photos.include?(feed_image)
  #     used_feed_photos << feed_image
  #     feed_photos << feed_image
  #   end
  # end
  # Create the grandma with the selected image and feed photos
  grandma = Grandma.create!(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    location: addresses[i],
    skills: Faker::Hobby.activity,
    user_id: User.all.sample.id
  )
end

