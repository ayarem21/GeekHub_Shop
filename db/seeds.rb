# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(title: "Book", description:"Some description book")
Category.create(title: "Magazine", description:"Some description magazine")
Category.create(title: "Manga", description:"Some description manga")

prng = Random.new

10.times do |i|
  Product.create(title: "Book top #{i}", description: "Some top book", price: prng.rand(1.0..900.0), category_id: 1)
end

10.times do |i|
  Product.create(title: "Magazine top #{i}", description: "Some top magazine", price: prng.rand(1.0..900.0), category_id: 2)
end

10.times do |i|
  Product.create(title: "Manga top #{i}", description: "Some top manga", price: prng.rand(1.0..900.0), category_id: 3)
end

User.create(email: "admin@gmail.com", password: "123", admin: true)