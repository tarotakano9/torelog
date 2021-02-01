Rails.application.routes.draw do
  # ホーム画面へのルーティング
  root 'home#index'
  resources :home, only: [:index]

  # トレーニング記録へのルーティング
  resources :trainings do
    member do
      get :submit_log
    end
  end
end
