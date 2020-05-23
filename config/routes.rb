Rails.application.routes.draw do

	devise_for :users

	root "home#top"

	get "home/about" => "home#about"

	resources :shops do
		resource :likes, only: [:create, :destroy]
		resources :shop_comments, only: [:create, :destroy]
	end

	resources :users do
		member do
			get "goodbye"
			patch "bye"
		end

		member do
			get :following, :followers
		end
	resources :users, only: [:show, :edit, :update]

	resources :relationships, only: [:create, :destroy]

	end

end
