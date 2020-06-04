Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :artists, only: [:create]
      post "/artist_login", to: "auth#artist_login"
      get "/profile", to: "artists#profile"
      patch "/edit_profile", to: "artists#edit_profile"
    end
  end
end
