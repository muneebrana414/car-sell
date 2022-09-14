Rails.application.routes.draw do
  root 'home#index'
  get 'home/new', to: 'home#new'
  patch 'home/add_to_favorite'
  get 'vehicle/list/:id', to: 'home#show', as: 'vehicle'

  devise_for :users, controllers: {registrations: "registrations"}

  resources :vehicles do
    collection do
      get :favorite_vehicles
      get :user_listing
    end
  end
  #get 'vehicle/favorite_vehicles', to: 'vehicles#favorite_vehicles', as: 'favorite_vehicles'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
