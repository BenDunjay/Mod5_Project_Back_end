Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :artists, only: [:create]
      resources :venues
      resources :availabilities
      post "/artist_login", to: "auth#artist_login"
      get "/profile", to: "artists#profile"
      patch "/edit_profile", to: "artists#edit_profile"
      post "/create_availability", to: "availabilities#create_availability"
      post "/venue_login", to: "auth#venue_login"
    end
  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
