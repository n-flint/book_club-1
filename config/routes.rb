Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  resources :books, only: [:index, :show, :new, :create, :destroy] do
    resources :reviews, only: [:new, :create, :destroy]
    resources :authors, only: [:new, :destroy, :create]
  end

  resources :authors, only: [:show, :destroy]
    resources :books, only: [:destroy]

  resources :reviews, only: [:index, :destroy]
end
