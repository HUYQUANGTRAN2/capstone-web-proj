# config/routes.rb
Rails.application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "pages/settings"
  root "notes#index"

  resources :notes
  get "pinned", to: "notes#pinned"
  get "settings", to: "pages#settings"

  # config/routes.rb
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "sign_out", to: "sessions#destroy"
end
