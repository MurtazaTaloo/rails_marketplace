# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



  Brand.create(name: "Absorba")
  Brand.create(name: "Acorn Kids")
  Brand.create(name: "Alphabet Soup")
  Brand.create(name: "Bandit Kids")
  Brand.create(name: "Baobab")

  Category.create(name: "Category1")
  Category.create(name: "Category2")
  Category.create(name: "Category3")
  Category.create(name: "Category4")
  Category.create(name: "Category5")

  Size.create(name: "Size1")
  Size.create(name: "Size2")
  Size.create(name: "Size3")
  Size.create(name: "Size4")
  Size.create(name: "Size5")

  counter = 1
  10.times do
  User.create(email: "#{counter}@#{counter}.com", password: "password", name: "#{counter}name", address:"#{counter}address")

  counter += 1
  end
  puts "seeds completed"