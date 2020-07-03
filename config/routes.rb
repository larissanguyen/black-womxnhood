Rails.application.routes.draw do
  	resources :resources, only: [:index, :show, :new, :create]
	resources :authors, only: [:index, :show, :new, :create]
	resources :topics, only: [:index, :show, :new, :create]
	resources :comments, only: [:new, :create]
	resources :users, only: [:show, :edit, :update, :destroy]

	get "/signup", to: "users#new"
	post "/signup", to: "users#create"

	get "/login", to: "sessions#new"
	post "/login", to: "sessions#create"
	delete "/logout", to: "sessions#destroy"
end
