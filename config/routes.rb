Rails.application.routes.draw do

  resources :users do 
    resources :businesses, only: [:index, :new, :show]
  end

  resources :businesses do
    resources :comments
  end

  get '/auth/facebook/callback' => 'sessions#create'

end