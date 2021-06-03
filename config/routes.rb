Rails.application.routes.draw do
  root 'sessions#new'
  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users, only: [:new, :create, :show]
  end
end
