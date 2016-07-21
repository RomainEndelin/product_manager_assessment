# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

cat1 = Category.create({
  "id": "1",
  "name": "Category1"
})
cat2 = Category.create({
  "id": "2",
  "name": "Category2"
})
cat3 = Category.create({
  "id": "3",
  "name": "Category3"
})

Product.create({
  "id": "1",
  label: "My product",
  size: 10,
  color: "blue",
  price: 100,
  categories: [cat1, cat3]
})

Product.create({
  "id": "2",
  label: "My second product",
  size: 50,
  color: "red",
  price: 200,
  categories: [cat2]
})
