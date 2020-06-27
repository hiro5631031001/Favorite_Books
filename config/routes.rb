Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'books#index'
  resources :users, only: [:show, :edit, :update] do
    member do
      get 'bookcase'
      get 'category'
      get 'read_log'
    end
  end
  resources :books do
    resources :recollections 
  end
end
