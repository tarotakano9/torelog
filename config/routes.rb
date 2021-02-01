Rails.application.routes.draw do
  # ホーム画面へのルーティング
  root 'home#index'
  resources :home, only: [:index]
end
