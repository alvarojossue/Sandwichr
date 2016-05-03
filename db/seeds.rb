# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ingredient_1 = Ingredient.create(name: 'ham', calories: 70)
ingredient_2 = Ingredient.create(name: 'turkey', calories: 100)
ingredient_3 = Ingredient.create(name: 'lettuce', calories: 10)
ingredient_4 = Ingredient.create(name: 'tomato', calories: 20)
ingredient_5 = Ingredient.create(name: 'bread', calories: 200)

sandwich_1 = Sandwich.create(name: 'Carlos Special', bread_type: 'Venezuelan')
sandwich_2 = Sandwich.create(name: 'Andreza Special', bread_type: 'Brazilian')
sandwich_3 = Sandwich.create(name: 'Alvaro Special', bread_type: 'Nicaraguan')