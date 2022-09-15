Rails.application.routes.draw do
  root 'home#index'
  patch 'home/add_to_favorite'

  devise_for :users, controllers: {registrations: "registrations"}

  resources :vehicles do
    resources :steps
    collection do
      get :favorite_vehicles
      get :user_listing
    end
  end
  #get 'vehicle/favorite_vehicles', to: 'vehicles#favorite_vehicles', as: 'favorite_vehicles'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
