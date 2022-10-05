Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :bookings, only: %i[index show update destroy]
    resources :reviews, only: %i[index show update destroy]
    resources :rooms
    #post 'new', to: 'rooms#create'
  end

  root 'pages#index'
  get 'about', to: 'pages#about'
  resources :bookings
  resources :rooms, only: %i[index show]
  resources :reviews, only: %i[index show create]
  resources :room_photos, except: :new
end
