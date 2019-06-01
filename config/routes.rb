Rails.application.routes.draw do
  devise_for :users

  root 'trips#index'
  
  resources :trips do
    resources :locations
  end

  resources :locations do
    resources :addresses
  end

end
