Rails.application.routes.draw do
  # resources :cart_items
  resources :carts, only: [:show]
  patch 'carts/:id/add_to_cart', to: "carts#add_item", as: 'add_to_cart'
  patch 'carts/:id/delete_item', to: "carts#delete_item", as: 'delete_item'
  resources :items
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
