Rails.application.routes.draw do

	devise_for :users

	root "home#top"

	get "home/about" => "home#about"

	resources :users, only: [:show, :edit, :update] do
		member do
			get "goodbye"
			patch "bye"
		end
	end

	resources :shops do
		resource :likes, only: [:create, :destroy]
		resources :shop_comments, only: [:create, :destroy]
	end

end
