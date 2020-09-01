Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :venues, only: [:create]
      resources :artists, only: [:create]
      get "/authorize", to: "auth#refresh"
      post "/artist_login", to: "auth#artist_login"
      get "/profile/:name", to: "artists#profile"
      patch "/edit_profile", to: "artists#edit_profile"
      post "/create_availability", to: "availabilities#create_availability"
      post "/venue_login", to: "auth#venue_login"
      get "/all_artists", to: "artists#all_artists"
      get "/get_availability/:id", to: "availabilities#get_availability"
      post "/create_request", to: "requests#create_request"
      patch "/accept_or_reject/:id", to: "requests#accept_or_reject"
      get "/all_bookings", to: "requests#all_bookings"
    end
  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
