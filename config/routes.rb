Rails.application.routes.draw do
  devise_for :users
  root 'prototypes/populars#index'
  resources :users, only: [:show, :edit]
  resources :prototypes, except: :index do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
    scope module: :prototypes do
      resources :populars, only: :index
      resources :newests, only: :index
  end
end
