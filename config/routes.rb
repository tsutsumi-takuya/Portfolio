Rails.application.routes.draw do

	devise_for :users

	root "home#top"

	get "home/about" => "home#about"

	resources :users, only: [:show, :edit, :update]

	resources :shops do
		resource :likes, only: [:create, :destroy]
		resources :shop_comments, only: [:create, :destroy]
	end

	resources :users do
		member do
			get "goodbye"
			patch "bye"
			get :following, :followers
		end
	end

end
