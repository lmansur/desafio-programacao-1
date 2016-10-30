Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :imports, only: [:show]
  resources :purchases, only: [:new, :create]
  root 'purchases#index'


end
