Rails.application.routes.draw do
  devise_for :users
  resources :wines, only: [:edit, :update]
  post "wines", to: "wines#create", as: "wines"
  
  resources :oenologists, only: [:new, :create]
  
  root 'wines#index'
end
