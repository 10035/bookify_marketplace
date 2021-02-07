Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :books do
    resources :orders, only: [:index, :create]
    member do
      get :author
    end
  end

  resources :orders, only: [:destroy] do
    resources :reviews, only: [:new, :create]
  end

  resources :orders, only: [:index]
  resources :reviews, only: [:index, :destroy]
end
