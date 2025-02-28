Rails.application.routes.draw do
  devise_for :users
  root "pages#index"

  get "/home", to: "pages#index"
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/property_listing", to: "pages#property_listing"
  get "/property_types", to: "pages#property_types"
  get "/add-property", to: "pages#add_property", as: :add_property
  get "/our-agents", to: "pages#our_agents"
  get "/testimonials", to: "pages#testimonials"
  post "/create", to: "pages#create"
  post "/bypass-sign-in", to: "pages#bypass_sign_in", as: :bypass_sign_in

  resources :pages
  resources :apartments
  resources :villas
end
