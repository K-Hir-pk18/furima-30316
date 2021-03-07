Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :users
  resources :products, only: [:index, :new, :post, :create, :show]

end