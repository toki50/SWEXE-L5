Rails.application.routes.draw do
  get "top/main"
  post "top/login"
  get "top/logout"
  
  resources :tweets
  resources :users
  root "tweets#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
