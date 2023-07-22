Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :property_ads

  get '/property_ad_locations/area_autocomplete_options', to: 'property_ad_locations#area_autocomplete_options', format: :json, only: [:area_autocomplete_options]

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  # Defines the root path route ("/")
  root to: 'pages#home'
end
