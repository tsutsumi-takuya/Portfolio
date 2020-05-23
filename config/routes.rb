Rails.application.routes.draw do

	devise_for :users

	root "home#top"

	get "home/about" => "home#about"

	root "users#index"

	get 'follow/:id' => 'relationships#follow', as: "follow"
  	get 'unfollow/:id' => 'relationships#unfollow', as: "unfollow"

  	resources :users, only: [:show, :edit, :update]

  	resources :relationships, only: [:follow, :unfollow]

	resources :shops do
		resource :likes, only: [:create, :destroy]
		resources :shop_comments, only: [:create, :destroy]
	end

	resources :users do
		member do
			get "goodbye"
			patch "bye"
		end
	end

end
