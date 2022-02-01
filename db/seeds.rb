# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

  user = User.first

  prng = Random.new
  puts "Iniciando los seed"

  10.times do
    portfolio = Portfolio.new(
      total_likes: prng.rand(180..200),
      stars_average: prng.rand(1..5),
      about: Faker::Books::Dune.quote,
      user: user
    )
    portfolio.save
    prng.rand(3..6).times do
      Design.create(
        portfolio: portfolio,
        title: Faker::Book.title,
        description: Faker::Book.author,
        likes: prng.rand(10..30)
      )
    end
  end
  puts "Final del seed"
