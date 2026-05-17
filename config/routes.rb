# config/routes.rb
Rails.application.routes.draw do
  get "pages/settings"
  root "notes#index"

  resources :notes
  get "pinned", to: "notes#pinned"
  get "settings", to: "pages#settings"
end


