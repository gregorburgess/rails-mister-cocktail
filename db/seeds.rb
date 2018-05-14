# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ***************************************************************************

# Using open URI for data

# Get Open URI to so we can get something (in this case a JSON) from the internet and JSON GEM so that we can parse it into a ruby object
require 'json'
require 'open-uri'

destroy.all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients_hash = JSON.parse(ingredients_serialized)

ingredients_hash["drinks"].each do |ingredient|
  ingredient_name =  ingredient["strIngredient1"]
  new_ingredient = Ingredient.new(name: ingredient_name)
  new_ingredient.save
  puts new_ingredient.name
end


# puts "#{user['name']} - #{user['bio']}"

# "strIngredient1"

# ______



# 100.times do
#  restaurant = Restaurant.new(
#   name:    Faker::Company.name,
#   address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
#   rating:  (0..5).to_a.sample
#   )
#   restaurant.save!
#   end

# ***************************************************************************

# How to just enter a few values values into your data base via a seed, fairly manually and a few at a time

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

# ***************************************************************************

# How to use Faker for fake data

# require 'faker'

# puts 'Creating 100 fake restaurants...'
# 100.times do
#   restaurant = Restaurant.new(
#     name:    Faker::Company.name,
#     address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
#     rating:  (0..5).to_a.sample
#   )
#   restaurant.save!
# end
# puts 'Finished!'

# ***************************************************************************

# How to using open URI for data

# require 'json'
# require 'open-uri'

# url = 'https://api.github.com/users/ssaunier'
# user_serialized = open(url).read
# user = JSON.parse(user_serialized)

# puts "#{user['name']} - #{user['bio']}"
