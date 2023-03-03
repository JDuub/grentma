require "faker"
require "open-uri"
require "cloudinary"

puts "Getting those amazing grandmas"
puts "Hold on"

Grandma.destroy_all
User.destroy_all
addresses = ["Rudi-Dutschke-Straße 26, 10969 Berlin", "Hanns-Braun-Straße 2, 14053 Berlin", "Lindenstraße 9-14, 10969 Berlin", "Am Wriezener bhf, 10243 Berlin", "Cantianstraße 24, 10437 Berlin", "Eisenbahnstraße 42-43, 10997 Berlin", "Kopenhagener Str. 33, 13407 Berlin", "Immanuelkirchstraße 32, 10405 Berlin", "Windscheidstraße 26, 10627 Berlin", "Sangerhauser Weg 1, 12349 Berlin" ]
description = ["Just a retired teacher who loves spending time in her garden and knitting cozy blankets for my family. #GrandmaLife #Gardening #Knitting",  "Warm and friendly grandma who loves to bake pies and cookies for my grandkids. Also an expert storyteller and loves to sew clothes and blankets. #Baking #Storytelling #Sewing",  "Retired nurse who loves to knit and crochet beautiful blankets and clothes for my family. Also an amazing cook and loves to prepare hearty meals. #Knitting #Crocheting #Cooking",  "Sweet and gentle grandma who loves to quilt beautiful blankets for my family. Also an avid gardener and loves to cook delicious meals. #Quilting #Gardening #Cooking",  "Creative grandma who loves to knit and sew unique clothes and accessories for my grandkids. Also an excellent baker and loves to make homemade bread and pastries. #Knitting #Sewing #Baking",  "Fun-loving grandma who loves to spend time in her garden and cook delicious meals for my family. Also an expert storyteller and loves to share stories from my childhood. #Gardening #Cooking #Storytelling",  "Talented grandma who loves to quilt beautiful blankets and make homemade bread and pastries for my family. Also an avid knitter and loves to make cozy sweaters and scarves. #Quilting #Baking #Knitting",  "Warm and caring grandma who loves to cook delicious meals, share stories from my life, and tend to my garden. Always there to offer a listening ear and a comforting hug. #Cooking #Storytelling #Gardening",  "Creative grandma who loves to sew beautiful clothes and accessories for my family. Also an amazing cook and loves to prepare delicious meals using fresh ingredients. #Sewing #Cooking #Creativity",  "Retired teacher who loves to knit cozy blankets and scarves for my family. Also a passionate gardener and loves to tend to my flowers and vegetables. #Knitting #Gardening #RetirementLife"]

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
    user_id: User.all.sample.id,
    description: description.sample
  )

  rand_num = rand(2..14)
  selected_image = grandma.image_url.attached? ? grandma.image_url : "app/assets/images/profile/#{rand_num}- feed.png"
  file = URI.open(selected_image)
  grandma.image_url.attach(io: file, filename: "#{rand_num}.png", content_type: "image/png") unless grandma.image_url.attached?

  # FEED
  2.times do
    rand_num = rand(2..14)
    selected_feed_photo = nil
    loop do
      selected_feed_photo = "app/assets/images/feed/#{rand_num}- feed.jpg"
      break if !grandma.feed_photos.attached? || !grandma.feed_photos.map{|photo| photo.filename.to_s}.include?("#{rand_num}.jpg")
    end
    file = URI.open(selected_feed_photo)
    grandma.feed_photos.attach(io: file, filename: "#{rand_num}.jpg", content_type: "image/jpg")
  end
end
