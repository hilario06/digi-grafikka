# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

  prng = Random.new
  puts "Iniciando los seed"

  # portafolio 1
  user1 = User.new(
    email: 'hilario.huaman.6@gmail.com',
    password: '123456',
    password_confirmation: '123456')
  user1.save
  portfolio1 = Portfolio.new(
                total_likes: prng.rand(180..200),
                stars_average: prng.rand(1..5),
                about: Faker::Books::Dune.quote,
                user: user1
              )
  portfolio1.save

  prng.rand(3..6).times do
    Design.create(
      portfolio: portfolio1,
      title: Faker::Book.title,
      description: Faker::Book.author,
      likes: prng.rand(10..30)
    )
  end

 # portafolio 2
  user2 = User.new(
    email: 'dasly@gmail.com',
    password: '123456',
    password_confirmation: '123456')
  user2.save
  portfolio2 = Portfolio.new(
                total_likes: prng.rand(180..200),
                stars_average: prng.rand(1..5),
                about: Faker::Books::Dune.quote,
                user: user2
              )
  portfolio2.save

  prng.rand(3..6).times do
    Design.create(
      portfolio: portfolio2,
      title: Faker::Book.title,
      description: Faker::Book.author,
      likes: prng.rand(10..30)
    )
  end

  # portafolio 2
  user3 = User.new(
    email: 'hilario@gmail.com',
    password: '123456',
    password_confirmation: '123456')
  user3.save
  portfolio3 = Portfolio.new(
                total_likes: prng.rand(180..200),
                stars_average: prng.rand(1..5),
                about: Faker::Books::Dune.quote,
                user: user3
              )
  portfolio3.save

  prng.rand(3..6).times do
    Design.create(
      portfolio: portfolio3,
      title: Faker::Book.title,
      description: Faker::Book.author,
      likes: prng.rand(10..30)
    )
  end

  puts "Final del seed"
