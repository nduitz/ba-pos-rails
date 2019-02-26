# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# @products = Product.create!([
#   {name: "Fanta", description: "Lecker", price: 3.5},
#   {name: "Cola", description: "Lecker", price: 2.5},
#   {name: "Sprite", description: "Lecker", price: 3.8},
#   {name: "Bier", description: "Lecker", price: 5.5}
# ])

# @basket = Basket.create(
#   {name: "basket1"})

# @basket.product_positions.create({product: @products[0], amount: 2 })

products = (1..100).to_a.map do |n|
  name = Faker::Food.dish
  description = Faker::Lorem.paragraph(5)
  price = rand(1.00..10.00).round(2)
  puts(price)
  Product.create!(
    name: name,
    description: description,
    price: price
  )
end

# Create Posts 
baskets = (1..100).to_a.map do |n|
  name = Faker::Book.title   

  basket = Basket.create!(
    name: name
  )

  5.times do |n|
    basket.product_positions.create(
      {product: products[rand(products.size)], amount: rand(1..10)}
    )
  end
end
