Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :portfolios do
    # collection do
      # put "welcome"
    # end
    resources :reviews, only: :create
    resources :designs, only: [ :index, :new, :create ]
    resources :orders, only: [ :new, :create ]
    resources :followers, only: [ :new, :create ]
  end
  resources :designs, only: [ :show, :edit, :update, :destroy ] do
    member do
      patch "upvote", to: "designs#upvote" # likes
    end
  end
  resources :reviews, only: [ :destroy ]
  put '/portfolio/:id/follow', to: 'portfolios#follow', as: 'follow' #seguidores
  put 'is_portfolio', to: 'portfolios#is_portfolio', as: 'is_portfolio'
  get 'welcome', to: 'portfolios#welcome', as: 'welcome'
  resources :orders, only: [ :index, :show, :edit, :update, :destroy ]
  resources :followers, only: [ :index, :show, :edit, :update, :destroy ]
  # resources :technologies, only: [ :new, :create ]
  # resources :designs_technologies, only: [ :index, :new, :create ]
end
