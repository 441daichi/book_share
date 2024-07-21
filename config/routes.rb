Rails.application.routes.draw do
  devise_for :users
  root to: 'reviews#index'

  resources :reviews do
    resources :comments, only: [:new, :create]
  end
  resources :users, only: [:show]
end
