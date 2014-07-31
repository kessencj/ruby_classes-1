require_relative 'cookbook'

mex_cuisine = Cookbook.new("Mexican Cooking")
burrito = Recipe.new("Bean Burrito", ["tortilla", "bean"], ["heat beans", "place beans in tortilla", "roll up"])

burrito.title = "Veggie Burrito"
burrito.ingredients = ["tortilla", "tomatoes"]
burrito.steps = ["heat tomatoes", "place tomatoes in tortilla", "roll up"]

# p burrito.title # "Veggie Burrito"
# p burrito.ingredients # ["tortilla", "tomatoes"]
# p burrito.steps

 mex_cuisine.recipes # []
 mex_cuisine.add_recipe(burrito)
 p mex_cuisine.recipes

#mex_cuisine.recipe_titles # Veggie Burrito
#mex_cuisine.recipe_ingredients # These are the ingredients for Veggie Burrito: ["tortilla", "bean"]