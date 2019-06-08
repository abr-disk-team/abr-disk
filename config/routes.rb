Rails.application.routes.draw do
  root 'home#top'

  get 'users/another_address'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :items
  resources :labels
  resources :artists
  resources :genres
  resources :carts
  resources :orders

end
