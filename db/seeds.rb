require 'json'
require 'uri'
require 'net/http'

puts "Deleting previous ingredients..."
Ingredient.destroy_all

puts "Fetching the JSON file and parsing ingredients..."
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
uri = URI(url)
response = Net::HTTP.get(uri)
list_ingredients = JSON.load(response)
ingredients = list_ingredients["drinks"]

puts "Creatings ingredients..."
ingredients.each do |ingredient|
  Ingredient.create!(name: "#{ingredient["strIngredient1"]}")
end

puts "Done!"


