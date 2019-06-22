Rails.application.routes.draw do

  root 'home#top'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :another_addresses, only: [:new, :create, :edit, :update, :destroy]
    resources :cart_items, only: [:index]
  end
  get 'users/:id/address' => 'users#address_edit', as: "edit_address"
  get 'users/:id/favorites' => 'favorites#show', as: "user_favorites"

  get 'users/:user_id/cart_items/form' =>'cart_items#form', as: "order_confirm"
  get 'users/:user_id/carts/:id/confirm' => 'carts#confirm'
  post 'users/:user_id/carts/:cart_id/add_item/:item_id' => 'carts#add_item'
  post 'users/:user_id/carts/:cart_id/add_item/:item_id/update_item' =>'carts#update_item'
  # patch '/check_cart/:id' =>'carts#check'
  # delete '/delete_item' => 'carts#delete_item'



  resources :items do
    resource :favorites, only: [:create, :destroy]
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    resources :cart_items, only: [:create, :create, :destroy]
  end
  delete 'items/:item_id/favorites/index' => "favorites#destroy_index", as: "destroy_index"
  post   'items/:item_id/favorites/index' => "favorites#create_index", as: "create_index"
  get 'search', to: 'items#index'
  resources :labels
  resources :artists
  resources :genres
  resources :orders
  resources :contacts
  get 'complete' => 'contacts#complete'


end
