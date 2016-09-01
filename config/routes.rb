Rails.application.routes.draw do
  root 'prototypes#index'

  resource :prototypes, only: [:index, :new, :show]

end
