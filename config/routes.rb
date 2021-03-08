Rails.application.routes.draw do
  post "wines", to: "wines#create", as: "wines"
  
  root 'wines#index'
end
