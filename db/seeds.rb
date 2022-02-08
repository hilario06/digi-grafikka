# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Portfolio.destroy_all
Design.destroy_all

technologies = %w[Photoshop InDesign CorelDraw Illustrator Inkscape Sketch Canva Photoscape Other ]

prng = Random.new
puts "Iniciando los seed"

20.times do |j|
  i = 0
  tag_list = []
  while i < 2
    sample = technologies.sample
    if !tag_list.include? sample
      tag_list << sample
      i += 1
    end
  end
  user = User.create(
    email: "user#{j}@lewagon.com",
    password: '123456',
    image: Faker::Avatar.image,
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: "#{Faker::Address.city}, #{Faker::Address.country}"
  )
    
  portfolio = Portfolio.create(
                  stars_average: prng.rand(1..5),
                  about: Faker::Books::Dune.quote,
                  user: user,
                  tag_list: tag_list.join(', '),
                  total_followers: prng.rand(5..50),
                  total_likes: prng.rand(10..100)
                )

  prng.rand(5..20).times do |t|
    tags = %w[digital computer portrait scenary landscape scene decoration]
    Design.create(
      portfolio: portfolio,
      title: Faker::Book.title,
      description: Faker::Book.author,
      image: "https://loremflickr.com/400/400/design,#{tags.sample},#{tags.sample}"
    )
  end
end

puts "Final del seed"
