# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    # get '/users/log_in' => 'devise/sessions#new'
  end
  root 'pages#index'
  resources :rooms
  resources :bookings
  resources :reviews

  namespace :admin do
    resources :reviews do
      member do
        get :confirmation
      end
    end
    resources :bookings do
      member do
        get :confirmation
      end
    end
    resources :rooms, :bookings, :reviews
    get '/admin/dashboard', as: :authenticated_root
    get 'dashboard', to: 'pages#dashboard'
    get 'export(.:format)', to: 'bookings#export'
    post '/admin/rooms/new', to: 'rooms#create'
  end
  unauthenticated :users do
    namespace :admin do
      root to: 'session#new', as: :unauthenticated_root
    end
  end
end
