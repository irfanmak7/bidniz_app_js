Rails.application.routes.draw do

  root 'welcome#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#facebookAuth'

  resources :users
  resources :businesses
  # resources :comments

end