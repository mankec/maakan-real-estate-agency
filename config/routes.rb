Rails.application.routes.draw do
  root "pages#index"

  get "/home", to: "pages#index"
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/property_listing", to: "pages#property_listing"
  get "/property_types", to: "pages#property_types"
  get "/our-agents", to: "pages#our_agents"
  get "/testimonials", to: "pages#testimonials"
end
