Rails.application.routes.draw do
  devise_for :users
  get 'books/index'
  get 'books/show'
  get 'books/create'
  root to: 'pages#home'
  resources :books
end
