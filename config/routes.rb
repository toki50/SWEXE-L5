Rails.application.routes.draw do
  # 最初にユーザー登録画面を表示
  root "users#new"

  # ユーザー登録
  resources :users, only: [:new, :create]

  # ログイン・ログアウト
  get "top/main", to: "top#main", as: :top_main
  post "top/login", to: "top#login_process", as: :top_login
  get "top/logout", to: "top#logout", as: :top_logout

  # ツイート関連
  resources :tweets, only: [:index, :new, :create, :destroy]

  # いいね関連
  resources :likes, only: [:create, :destroy]
end
