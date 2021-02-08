Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :books do
    resources :orders, only: [:index, :create]
    member do
      get :author
    end
  end

  resources :orders, only: [:destroy, :new] do
    resources :reviews, only: [:new, :create]
  end

  resources :orders, only: [:index, :show, :edit, :update]
  resources :reviews, only: [:index, :destroy]
end
