# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)
Ingredient.destroy_all

require 'json'
require 'open-uri'

puts "Destroying everything..."
puts "Seeding your database one ingredient at a time..."

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drink_serialized = open(url).read
drinks = JSON.parse(drink_serialized)
# p drink
drinks.each_with_index do |drink, index|
  list = drink[1]
  list.each do |x|
    Ingredient.create(name: x["strIngredient1"])
  end
end

puts "Your database has successfully been populated with #{Ingredient.count} ingredients!"
