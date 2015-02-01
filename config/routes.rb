Rails.application.routes.draw do

  root "polls#index"

  resources :polls,    only: [:index, :new, :create]
  resources :users,    only: [:new, :create]
  get  "login",  to: "sessions#new"
  post "login",  to: "sessions#create"
  get  "logout", to: "sessions#destroy"
end
