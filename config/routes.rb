Rails.application.routes.draw do

  resources :users do 
    resources :businesses
  end

end