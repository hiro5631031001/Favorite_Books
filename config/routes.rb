Rails.application.routes.draw do
  root to: 'books#index'
  get 'books/search'
  resources :books 
end
