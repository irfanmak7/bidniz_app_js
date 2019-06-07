Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]

  resources :users, only: [:show] do 
    resources :businesses, only: [:index, :new, :show]
  end

  resources :businesses do
    resources :comments
  end

  get '/auth/facebook/callback' => 'sessions#create'

  root "welcome#home"

end