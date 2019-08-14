Rails.application.routes.draw do

  root 'welcome#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#facebookAuth'

  get 'businesses/all' => 'businesses#all'

  resources :users
  resources :businesses

  resources :users, only: [:show] do
    resources :businesses, only: [:show, :index]
  end

  resources :businesses, only: [:show] do
    resources :comments
  end

  resources :businesses, only: [:show] do
    resources :tags
  end
end