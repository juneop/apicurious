Rails.application.routes.draw do
  resources :searches
  resources :responses
  resources :violations
  root 'responses#new'
end
