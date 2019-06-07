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
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  
  get '*path' => redirect('/')

end