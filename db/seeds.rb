# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

cat1 = Category.create({
  "name": "Category1"
})
cat2 = Category.create({
  "name": "Category2"
})
cat3 = Category.create({
  "name": "Category3"
})

Product.create({
  name: "My product",
  size: 10,
  color: "blue",
  price: 100,
  categories: [cat1, cat3]
})

Product.create({
  name: "My second product",
  size: 50,
  color: "red",
  price: 200,
  categories: [cat2]
})
