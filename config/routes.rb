Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :imports
  root 'purchases#index'


  resources :purchases do
    collection { post :import}
  end
end
