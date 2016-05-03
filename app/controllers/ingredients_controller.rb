class IngredientsController < ApplicationController

	def index
		ingredients = Ingredient.all
		render json: ingredients
	end

	def create
		ingredient = Ingredient.create(ingredient_params) #calling the method in private
		render json: ingredient
	end

	def show
		ingredient = Ingredient.find_by(id: params[:id])
		unless ingredient #Or sandwich.nil?
			render json: { error: "ingredient not found"}, status: 404
			return
		end

		render json: ingredient
	end

	def delete
		ingredient = Ingredient.find_by(id: params[:id])
		unless ingredient
			render json: { error: "ingredient not found"}, status: 404
			return
		end

		ingredient.destroy

		render json: sandwich
	end


	private 

	def ingredient_params
		params.require(:ingredient) #object
		.permit(:name, :calories) #attributes
	end
end



