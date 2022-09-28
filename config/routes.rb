Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root to: "items#index"

  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: :create
    collection do
          get 'search'
    end
  end
  end