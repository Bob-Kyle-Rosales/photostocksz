
Rails.application.routes.draw do
  # Route for the index action of the PhotosController
  get "photos" => "photos#index"
  
  # Resourceful route for the PhotosController
  resources :photos
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
