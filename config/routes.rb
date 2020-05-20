Rails.application.routes.draw do

	devise_for :users
	root "home#top"
	get "home/about" => "home#about"
	resources :user, only: [:show, :edit, :update]
	resources :shops do
		resources :likes, only: [:create, :destroy]
		resources :shop_comments, only: [:create, :destroy]
	end
  
end
