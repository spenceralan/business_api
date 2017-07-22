Rails.application.routes.draw do
  resources :businesses

  get "businesses/random", to: "businesses#random"
  
  get "businesses/search", to: "businesses#search"

  match "*path", to: -> (env) { [404, {}, ['{"error": "not_found"}']] }, via: :all
end
