Rails.application.routes.draw do
  root 'home#top'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/:id/another_address' => 'users#another_address', as: "another_address"
  post 'users/:id/another_address' => 'users#another_address_create'
  get 'users/:id/address' => 'users#address_edit', as: "edit_address"
  resources :users
  resources :items
  resources :labels
  resources :artists
  resources :genres
  resources :carts
  resources :orders

end
