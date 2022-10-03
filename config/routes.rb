Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :bookings
    resources :reviews
    resources :rooms
  end

  root 'pages#index'
  get 'about', to: 'pages#about'
  resources :bookings
  resources :rooms
  resources :reviews
  resources :room_photos
end
