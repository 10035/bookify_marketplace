Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'books/index'
  get 'books/show'
  get 'books/create'
  resources :books
end
