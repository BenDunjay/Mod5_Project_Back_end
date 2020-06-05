Rails.application.routes.draw do
  resources :availabilities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :artists, only: [:create]
      post "/login", to: "auth#create"
      get "/profile", to: "artists#profile"
    end
  end
end
