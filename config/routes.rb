Rails.application.routes.draw do
  resources :posts
  devise_for :users
  # get 'home/index'
  root to: "home#index"
  
  post "toggle_like", to:"likes#toggle_like", as: :toggle_like

  resources :comments, only:[:create, :destroy]
  resources :users, only:[:show, :index]

  post "follow", to: 'follow#follow', as: :follow
  delete 'unfollow', to: 'follows#unfollow', as: :unfollow
  delete 'concel_request', to: 'follows#cancel_request', as: :cancel_request 

  post 'accept_follow', to: 'follows#accept_follow', as: :accept_follow
  delete 'decline_follow', to: 'follows#decline_follow', as: :decline_follow

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
