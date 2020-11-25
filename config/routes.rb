Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :venues, only: [:create]
      resources :artists, only: [:create]

      controller :artists do
        get "/profile/:name" => :profile
        patch "/edit_profile" => :edit_profile
        get "/all_artists" => :all_artists
      end

      controller :auth do
        get "/authorize" => :refresh
        post "/artist_login" => :artist_login
        post "/venue_login" => :venue_login
      end

      controller :availabilities do
        post "/create_availability" => :create_availability
        get "/get_availability/:id" => :get_availability
      end

      controller :requests do
        post "/create_request" => :create_request
        patch "/accept_or_reject/:id" => :accept_or_reject
        get "/all_bookings" => :all_bookings
      end
    end
  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
