Rails.application.routes.draw do
  root to: 'cocktails#index'

  resources :cocktails, only: [:show, :index, :new, :create, :destroy] do
    resources :doses, only: [:new, :create, :show]
  end

  resources :doses, only: [:destroy]

  resources :ingredients, only: [:show, :index]
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

