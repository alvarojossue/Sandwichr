Rails.application.routes.draw do
 
	resources :sandwiches, only: [:index, :show], controller: "sandwich_views"
	scope "/api" do
		    resources :sandwiches
		    resources :ingredients
		    post "/sandwiches/:id/ingredients/add" => "sandwiches#add_ingredient"
	end
end

