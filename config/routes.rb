
Rails.application.routes.draw do
  apipie
  # Route for the index action of the PhotosController
  # get "photos" => "photos#index"
  
  # Resourceful route for the PhotosController
  resources :photos

  namespace :api do
    namespace :v1 do
      resources :photos, only: [:index, :show, :create, :update, :destroy]
    end
  end
  
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
