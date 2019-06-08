Rails.application.routes.draw do

  root 'welcome#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#facebookAuth'

  resources :users
  resources :businesses
  # resources :comments

  resources :users, only: [:show] do
    resources :businesses, only: [:show, :index]
  end

end