Rails.application.routes.draw do
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	resources :resources, only: [:index, :show, :new, :create]
	resources :authors, only: [:index, :show]
	resources :topics, only: [:index, :show]
	resources :users, only: [:edit, :update, :destroy]

	get "/signup", to: "users#new"
	post "/signup", to: "users#create"
	get "/users/:id", to: "users#show"

	get "/login", to: "sessions#new"
	post "/login", to: "sessions#create"
	delete "/logout", to: "sessions#destroy"
end
