$(document).on("ready", function(){
	$(".js-list-ingredients").on("click",".js-ingredient-button", function(event){
		event.preventDefault();
		var selectedIngredient = $(event.currentTarget).data("ingredient-id");
		var theSandwich = $(".js-sandwich-holder").prop("id");


		console.log(theSandwich)
		console.log(selectedIngredient)

		$.ajax({
			type: "post",
			url: `/api/sandwiches/${theSandwich}/ingredients/add`,
			data: {ingredient_id: selectedIngredient},
			success: function(data){
				console.log(data)
				updateSandwich(data);
			},
			error: function(error){
				console.log("Error");
				console.log(error.responseJSON);
			}
		})

	})

function updateSandwich(the_object){
	var html = `<li>${the_object.ingredients.name} - ${the_object.ingredients.calories} calories </li>`
	$(".js-ul").append(html)

	// var total_pre = parseInt($(".js-total-calories").text().split(" ")[2])
	var total_pre = parseInt($(".js-total-calories")[0].innerText.split(" ")[2])
	var calories = parseInt(the_object.ingredients.calories)
	var total_calories = total_pre + calories
	console.log(total_pre)
	// $(".js-total-calories").text(`Total calories: ${total_calories}`)
	$(".js-total-calories").text("Total calories: " + total_calories)
}

})
