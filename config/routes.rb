Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  get 'books/search'
  resources :books 
end
