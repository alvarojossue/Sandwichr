class SandwichViewsController < ApplicationController

	def index
		@sandwiches = Sandwich.all
		render 'index'
	end

	def show
		@sandwich = Sandwich.find_by(id: params[:id])
		@ingredients = @sandwich.ingredients
		@total_calories = @ingredients.reduce(0){|sum, x| sum + x.calories}
		@all_ingredients = Ingredient.all
		render 'show'
	end
end




