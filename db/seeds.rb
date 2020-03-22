require 'open-uri'
require 'json'
Ingredient.destroy_all
puts "Seeding started...."
array = ("a".."z").to_a
array.each do |letter|
  response = open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{letter}")
  json = JSON.parse(response.read)
  json["drinks"].each do |drink|
    drink_hash = { name:  drink["strDrink"], instructions: drink["strInstructions"],
                   thumbnail: drink["strDrinkThumb"] }
      cocktail = Cocktail.create(drink_hash)
    array = (1..15).to_a
    array.each do |number|
      unless drink["strIngredient#{number}"].nil?
        # if Ingredient.where(name: drink["strIngredient#{number}"]).exists?
        #   ingredient = Ingredient.where(name: drink["strIngredient#{number}"])
        #   Dose.create(description: drink["strMeasure#{number}"], ingredient_id: ingredient.ids,
        #   cocktail_id: cocktail.id)
        # else
          ingredient = Ingredient.create(name: drink["strIngredient#{number}"])
          Dose.create(description: drink["strMeasure#{number}"], ingredient_id: ingredient.id,
          cocktail_id: cocktail.id)
        # end
      end
    end
  end
end

