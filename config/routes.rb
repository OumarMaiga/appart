Rails.application.routes.draw do

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'  
  }

  resources :caracteristiques
  root to: "pages#index"
  resources :adresses
  
  resources :types

  resources :locations do
    get 'type', on: :member
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

  get '/:adresse', to: 'pages#adresse', as: 'adresse'

  get '/:type/:adresse', to: 'pages#type_adresse', as: 'type_adresse'

  resources :notifications, only: [:index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
