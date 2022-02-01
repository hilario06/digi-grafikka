Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :portfolios do
    resources :designs, only: [ :index, :new, :create ]
    resources :orders, only: [ :new, :create ]
    resources :followers, only: [ :index, :new, :create ]
  end
  resources :designs, only: [ :show, :edit, :update, :destroy ]
  resources :orders, only: [ :index, :show, :edit, :update, :destroy ]
  resources :followers, only: [ :show, :edit, :update, :destroy ]
  # resources :technologies, only: [ :new, :create ]
  # resources :designs_technologies, only: [ :index, :new, :create ]
end
