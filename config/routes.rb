Rails.application.routes.draw do
  resources :events
  resources :users
  root 'events#index'
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'attend', to: 'event#attend', as: 'attend'
end
