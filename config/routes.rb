Rails.application.routes.draw do

  get "businesses/random/", to: "businesses#random"
  
  get "businesses/search/", to: "businesses#search"

  resources :businesses

  match "*path", to: -> (env) { [404, {}, ['{"error": "not_found"}']] }, via: :all
end
