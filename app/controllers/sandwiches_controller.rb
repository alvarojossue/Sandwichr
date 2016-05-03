class SandwichesController < ApplicationController

	def index
		sandwiches = Sandwich.all
		render json: sandwiches
	end

	def create
		sandwich = Sandwich.create(sandwich_params) #calling the method in private
		render json: sandwich 
	end

	def show
		sandwich = Sandwich.find_by(id: params[:id])
		the_ingredients = Sandwich.find_by(id: params[:id]).ingredients # Or sandwich.ingredients
		unless sandwich #Or sandwich.nil?
			render json: { error: "sandwich not found"}, status: 404
			return
		end

		render json: { sandwich: sandwich, ingredients: the_ingredients }
	end

	def update
		sandwich = Sandwich.find_by(id: params[:id])
		unless sandwich
			render json: { error: "sandwich not found"}, status: 404
			return
		end

		sandwich.update(sandwich_params)

		render json: sandwich

	end

	def destroy 
		sandwich = Sandwich.find_by(id: params[:id])
		unless sandwich
			render json: { error: "sandwich not found"}, status: 404
			return
		end

		sandwich.destroy

		render json: sandwich
	end

	def add_ingredient
		sandwich = Sandwich.find_by(id: params[:id])
		ingredient = Ingredient.find_by(id: params[:ingredient_id])


		if sandwich.nil? || ingredient.nil?
			render json: {error: "ingredient or sandwich not found"}, status: 404
			return
		end

		sandwich.ingredients.push(ingredient)
		render json: {sandwich: sandwich, ingredients: ingredient}

	end

	private

	def sandwich_params
		params.require(:sandwich) #object
		.permit(:name, :bread_type) #attributes
	end


end
