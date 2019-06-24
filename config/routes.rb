Rails.application.routes.draw do

  get 'addresses/new'
  get 'addresses/edit'
  root 'home#top'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :addresses, only: [:new, :create, :edit, :update, :destroy]
    resources :cart_items, only: [:index]
    resources :orders, only: [:show, :create, :index]
  end
  get 'users/:id/address' => 'users#address_edit', as: "edit_address"
  get 'users/:id/favorites' => 'favorites#show', as: "user_favorites"

  get 'users/:user_id/cart_items/form' =>'cart_items#form', as: "order_form"
  get 'users/:user_id/cart_items/confirm' => 'cart_items#confirm', as: "order_confirm"
  # patch '/check_cart/:id' =>'carts#check'
  # delete '/delete_item' => 'carts#delete_item'



  resources :items do
    resource :favorites, only: [:create, :destroy]
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    resources :cart_items, only: [:create, :destroy, :update]
  end
  delete 'items/:item_id/favorites/index' => "favorites#destroy_index", as: "destroy_index"
  post   'items/:item_id/favorites/index' => "favorites#create_index", as: "create_index"
  get 'search', to: 'items#index'
  resources :labels
  resources :artists
  resources :genres
  resources :contacts
  get 'complete' => 'contacts#complete'


end
