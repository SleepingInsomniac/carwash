Rails.application.routes.draw do
  resources :users
  resources :washes
  resources :blacklists
  resources :charges
  resources :vehicles

  root 'washes#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
