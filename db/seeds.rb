require 'open-uri'
require 'json'

puts "creating ingredients..."

read_ingredients = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ingredients = JSON.parse(read_ingredients)
ingredients_array = ingredients["drinks"]
ingredients_array.each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

puts "ingredients created."
