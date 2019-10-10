Rails.application.routes.draw do
  resources :types
  resources :locations do
    resources :reservations
  end
  resources :reservations
  get 'reservations/my_reservation', to: 'reservations#my_reservation'
  get 'pages/users'
  root to: "pages#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'pages/search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
