# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'deleting previous Seeds...'
Restaurant.destroy_all

puts 'Creating new seeds...'
category = ["chinese", "italian", "japanese", "french", "belgian"]

5.times do
  rest = Restaurant.create(name: Faker::Restaurant.name,
                 address: Faker::Address.street_address,
                 phone_number: Faker::PhoneNumber.phone_number,
                 category: category.sample
                 )

  review = Review.new(content: Faker::Restaurant.review, rating: rand(0..5))
  review.restaurant = rest
  review.save
end

puts 'All set!'
