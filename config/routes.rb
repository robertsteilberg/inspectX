Rails.application.routes.draw do
  resources :approve_mechanics, only: [:index, :update, :destroy]
  resources :mechanic_profiles
  resources :mechanic_searches
  resources :inspections
  resources :mechanics do
    resources :inspections
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users, except: [:new, :create]

  get 'users/:id/set_admin' => 'users#set_admin'

  resources :models, only: :index
end
