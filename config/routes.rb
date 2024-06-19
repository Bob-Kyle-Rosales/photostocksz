
Rails.application.routes.draw do
  apipie
  # Route for the index action of the PhotosController
  # get "photos" => "photos#index"
  
  # Resourceful route for the PhotosController HTML View
  resources :photos

  # Resourceful route for the PhotosController API
  namespace :api do
    namespace :v1 do
      resources :photos, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:index, :show]
    end
  end

  resources :registrations, only: [:create, :destroy] do
    post 'confirm', on: :collection
  end

  resources :sessions, only: [ :create, :destroy ]
  
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
