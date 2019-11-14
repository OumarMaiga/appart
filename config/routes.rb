Rails.application.routes.draw do

  root to: "pages#index"
  resources :adresses
  
  resources :types

  resources :locations do
    resources :reservations
  end

  resources :reservations do
    collection do
      get 'my_reservation', to: 'reservations/my_reservation', as: 'my_reservation'
      get 'confirmer/:id', to: 'reservations#confirmer', as: 'confirmer'
    end
  end

  get 'users', to: 'pages#users', as: 'users'

  get 'user/:id', to: 'pages#user', as: 'user'

  get 'search', to: 'pages#search', as: 'search'

  get 'pages/query', to: 'pages#query'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :notifications, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
