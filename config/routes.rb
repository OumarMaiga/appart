Rails.application.routes.draw do

  root to: "pages#index"

  get '/dashboards', to: 'dashboards#index'

  get '/dashboards/administrateurs'
  post '/dashboards/administrateurs', to: 'dashboards#create_admin', as: 'create_admin'
  put '/dashboards/administrateurs/:email/change_state_admin', to: 'dashboards#change_state_admin', as: 'change_state_admin', :constraints => { :email => /[^\/]+/ }
  get '/dashboards/administrateurs/:email/edit', to: 'dashboards#edit_admin', as: 'edit_admin', :constraints => { :email => /[^\/]+/ }
  patch '/dashboards/administrateurs', to: 'dashboards#update_admin', as: 'update_admin'
  delete '/dashboards/administrateurs/:email', to: 'dashboards#delete_admin', as: 'delete_admin', :constraints => { :email => /[^\/]+/ }

  get '/profil/:email', to: 'pages#profil', as: 'profil', :constraints => { :email => /[^\/]+/ }

  get '/dashboards/locations'
  post '/dashboards/locations', to: 'dashboards#create_location', as: 'create_location'
  put '/dashboards/locations/:slug/change_state_location', to: 'dashboards#change_state_location', as: 'change_state_location'
  get '/dashboards/locations/:slug/edit', to: 'dashboards#edit_location', as: 'edit_location'
  patch '/dashboards/locations', to: 'dashboards#update_location', as: 'update_location'
  get '/dashboards/locations/:slug', to: 'dashboards#show_location', as: 'show_location'
  delete '/dashboards/locations/:slug', to: 'dashboards#delete_location', as: 'delete_location'

  get '/dashboards/types'
  post '/dashboards/types', to: 'dashboards#create_type', as: 'create_type'
  get '/dashboards/types/:slug', to: 'dashboards#show_type', as: 'show_type'
  get '/dashboards/types/:slug/edit', to: 'dashboards#edit_type', as: 'edit_type'
  patch '/dashboards/types', to: 'dashboards#update_type', as: 'update_type'
  delete '/dashboards/types/:slug', to: 'dashboards#delete_type', as: 'delete_type'

  get '/dashboards/caracteristiques'  
  post '/dashboards/caracteristiques', to: 'dashboards#create_caracteristique', as: 'create_caracteristique'
  get '/dashboards/caracteristiques/:libelle', to: 'dashboards#show_caracteristique', as: 'show_caracteristique'
  get '/dashboards/caracteristiques/:libelle/edit', to: 'dashboards#edit_caracteristique', as: 'edit_caracteristique'
  patch '/dashboards/caracteristiques', to: 'dashboards#update_caracteristique', as: 'update_caracteristique'
  delete '/dashboards/caracteristiques/:libelle', to: 'dashboards#delete_caracteristique', as: 'delete_caracteristique'

  get '/dashboards/utilisateurs'
  put '/dashboards/utilisateurs/:email/change_state_user', to: 'dashboards#change_state_user', as: 'change_state_user', :constraints => { :email => /[^\/]+/ }
  delete '/dashboards/utilisateurs/:email', to: 'dashboards#delete_user', as: 'delete_user', :constraints => { :email => /[^\/]+/ }

  get '/dashboards/reservations'
  get '/dashboards/reservations/:slug', to: 'dashboards#show_reservation', as: 'show_reservation'
  get '/dashboards/reservations/confirmer/:slug', to: 'dashboards#confirmer', as: 'confirmer'

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  resources :caracteristiques
  resources :adresses
  
  resources :types

  resources :locations do
    get 'type', on: :member
    resources :reservations
  end

  resources :reservations do
    collection do
      get 'my_reservation', to: 'reservations/my_reservation', as: 'my_reservation'
      get 'confirmer/:slug', to: 'reservations#confirmer', as: 'confirmer'
    end
  end

  get '/users', to: 'pages#users', as: 'users'

  get '/user/:id', to: 'pages#user', as: 'user'

  get '/search', to: 'pages#search', as: 'search'

  get '/pages/query', to: 'pages#query'

  get '/adresse/:adresse', to: 'pages#adresse', as: 'adresse'

  get '/type/:type/:adresse', to: 'pages#type_adresse', as: 'type_adresse'

  get '/filter', to: 'locations#filter', as: 'filter'

  resources :notifications, only: [:index, :show]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
