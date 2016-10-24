Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :users, only: [:show, :edit]
  resources :prototypes do
    resources :likes, only: [:create, :destroy]
  end
end
