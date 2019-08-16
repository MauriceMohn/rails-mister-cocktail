Rails.application.routes.draw do
  # get 'doses/show'
  # get 'doses/new'
  # get 'doses/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
      resources :doses, only: [:new, :show, :create]
    end
  root to: 'cocktails#index'
  resources :doses, only: [:destroy]
end
