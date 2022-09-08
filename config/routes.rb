Rails.application.routes.draw do
  root 'home#index'
  get 'home/new', to: 'home#new'

  devise_for :users, controllers: {registrations: "registrations"}

  resources :vehicles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
