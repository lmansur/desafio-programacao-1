Rails.application.routes.draw do
  root 'purchases#index'

  resources :purchases do
    collection { post :import}
  end
end
