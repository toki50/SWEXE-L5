Rails.application.routes.draw do
  get "top/main"
  post "top/login"
  get "top/logout"
  get "users/main"  # ← 複数形に修正
  
  resources :tweets
  resources :users
  resources :likes
  
  root "tweets#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
