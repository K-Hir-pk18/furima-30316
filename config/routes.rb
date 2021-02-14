Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products, only: :index
    ## pictweet コピペ
  ##resources :purchases do
    ##resources :comments, only: :create
    ##collection do
      ##get 'search'
    ##end
  ##end
  ##resources :purchases, only: :show

end

