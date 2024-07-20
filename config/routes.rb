Rails.application.routes.draw do
  devise_for :users
  root to: 'reviews#index'

  resources :reviews, only: [:index, :new, :create, :show, :edit] do
    resources :comments, only: [:new, :create]
  end
end
