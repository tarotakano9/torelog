Rails.application.routes.draw do
  devise_for :users
  # ホーム画面へのルーティング
  root 'home#index'
  resources :home, only: [:index]

  # トレーニング記録へのルーティング
  resources :trainings do
    member do
      get :submit_log
      patch :create_log
    end
  end
end
