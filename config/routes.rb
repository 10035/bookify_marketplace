Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :books do
    member do
      get :author
      get :order
    end
  end

#need help routing the reviews correctly
  resources :orders do
    resources :review, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
end
