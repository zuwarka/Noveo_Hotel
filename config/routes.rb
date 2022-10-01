Rails.application.routes.draw do
  devise_for :users

  root 'pages#index'
  get 'about', to: 'pages#about'

  resources :bookings
  resources :rooms
  resources :reviews

  namespace :admin do
    resources :bookings
    resources :reviews
    resources :rooms
  end
end
