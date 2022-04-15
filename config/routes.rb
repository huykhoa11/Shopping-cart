Rails.application.routes.draw do
	
  	get '/admin', to: 'admin#index'
  	devise_for :users
  	
 	get 'cards/show'
 	post 'order_items/update'
	resources :products
	resources :shop, only:[:index, :show]
	resources :order_items
	resource :cards, only:[:show, :destroy]

	root "shop#index"
	

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
