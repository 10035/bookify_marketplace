Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :books do
    member do
      get :author
    end
    resources :orders, only: [:create] do
      resources :reviews, only: [:new, :create]
    end
  end

  resources :reviews, only: [:destroy]
end
