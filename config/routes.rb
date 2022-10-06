Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    #get '/users/log_in' => 'devise/sessions#new'
  end
  root 'pages#index'
  get 'about', to: 'pages#about'
  resources :bookings
  resources :rooms, only: %i[index show]
  resources :reviews, only: %i[index show create]

  namespace :admin do
    resources :bookings, only: %i[index show update destroy]
    resources :reviews, only: %i[index show update destroy]
    resources :rooms
  end
end
