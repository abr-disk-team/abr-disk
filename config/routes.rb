Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items
  resources :labels
  resources :artists
  resources :genres
  resources :carts
  resources :orders

end
