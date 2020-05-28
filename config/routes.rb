Rails.application.routes.draw do

	devise_for :users

	root "home#top"

	root "users#index"

	get "home/about" => "home#about"

	post "like/:id" => "likes#like", as: "like"
  	delete "like/:id" => "likes#unlike", as: "unlike"

	get "follow/:id" => "relationships#follow", as: "follow"
  	get "unfollow/:id" => "relationships#unfollow", as: "unfollow"

  	resources :users, only: [:show, :edit, :update]

  	resources :relationships, only: [:follow, :unfollow]

	resources :shops do
		resource :likes, only: [:like, :unlike]
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
