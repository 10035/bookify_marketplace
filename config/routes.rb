Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'books/create'
  resources :books do
    resources :orders, only: [:create]
  end
end
