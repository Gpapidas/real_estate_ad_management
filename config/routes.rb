Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :property_ads

  get '/property_ad_allocations/area_autocomplete_options', to: 'property_ad_allocations#area_autocomplete_options', format: :json, only: [:area_autocomplete_options]

  # Defines the root path route ("/")
  root to: 'pages#home'
end
