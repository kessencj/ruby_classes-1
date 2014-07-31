class Cookbook

	def initialize (title)
		@title = title
	end

	def title=(new_title)
		@title = new_title
	end
end

class Recipe

	def initialize (title, ingredients, steps)
		@title = title
		@ingredients = ingredients
		@steps = steps
	end

	def title(new_title)
		@title = new_title
	end

	def ingredients(*new_ingredients)
		@ingredients = new_ingredients
	end

	def steps(*new_steps)
		@steps = new_steps
end

end


mex_cuisine = Cookbook.new("Mexican Cooking")

burrito = Recipe.new("Bean Burrito", ["tortilla", "bean"], ["heat beans", "place beans in tortilla", "roll up"])

puts mex_cuisine.title
puts burrito.title
p burrito.ingredients
p burrito.steps

mex_cuisine.title = "Mexican Recipes"
puts mex_cuisine.title

burrito.title = "Veggie Burrito"
burrito.ingredients = ["tortilla", "tomatoes"]
burrito.steps = ["heat tomatoes", "place tomatoes in tortilla", "roll up"]

p burrito.title # "Veggie Burrito"
p burrito.ingredients # ["tortilla", "tomatoes"]
p burrito.steps
