Rails.application.routes.draw do
  devise_for :users
  root to: 'reviews#index'

  resources :reviews do
    resources :comments, only: [:new, :create]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
end
