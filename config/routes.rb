Rails.application.routes.draw do

  root 'home#top'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :another_addresses, only: [:new, :create, :edit, :update, :destroy]
  end
  get 'users/:id/address' => 'users#address_edit', as: "edit_address"
  get 'users/:id/favorites' => 'favorites#show', as: "user_favorites"

  resources :items do
    resources :favorites, only: [:create, :destroy]
  end
  resources :labels
  resources :artists
  resources :genres
  resources :carts
  resources :orders


  post '/add_item/:id' => 'carts#add_item'
  post '/update_item' =>'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'
  get '/form_cart/:id' =>'carts#form'



  resources :contacts
  get 'complete' => 'contacts#complete'


end
