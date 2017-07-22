Rails.application.routes.draw do
  resources :businesses

  match "*path", to: -> (env) { [404, {}, ['{"error": "not_found"}']] }, via: :all
end
