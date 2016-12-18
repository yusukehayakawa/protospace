Rails.application.routes.draw do
  devise_for :users
  root 'prototypes/populars#index'
  resources :tags, only: [:index, :show]
  resources :users, only: [:show, :edit, :update]
  resources :prototypes, except: :index do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
    scope module: :prototypes do
      resources :populars, only: :index
      resources :newests, only: :index
  end
end
