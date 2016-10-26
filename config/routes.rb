Rails.application.routes.draw do
  devise_for :users
  root 'purchases#index'

  resources :purchases do
    collection { post :import}
  end
end
