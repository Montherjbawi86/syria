Rails.application.routes.draw do
  get "admin/dashboard"
  get "admin/users"
  get "admin/rides"
  get "admin/bookings"
  root 'home#index'

  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
  get 'how_it_works', to: 'home#how_it_works'
  get 'dashboard', to: 'dashboard#index'

  devise_for :users

  resources :rides do
    resources :bookings, only: [:new, :create], module: :rides
  end

  resources :bookings, only: [:index, :show, :update, :destroy] do
    member do
      post :confirm
      post :reject
    end
  end
namespace :admin do
  get 'dashboard', to: 'admin#dashboard'
  get 'users', to: 'admin#users'
  get 'rides', to: 'admin#rides'
  get 'bookings', to: 'admin#bookings'
  delete 'users/:id', to: 'admin#destroy_user', as: 'destroy_user'
  delete 'rides/:id', to: 'admin#destroy_ride', as: 'destroy_ride'
  patch 'bookings/:id', to: 'admin#update_booking', as: 'update_booking'
end
end
