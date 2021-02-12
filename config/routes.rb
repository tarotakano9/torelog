Rails.application.routes.draw do
  devise_for :users
  # ホーム画面へのルーティング
  root 'home#index'
  resources :home, only: [:index, :show]

  # トレーニング記録へのルーティング
  resources :trainings do
    member do
      get :show_result
      get :edit_log
      patch :update_log
    end
  end
end
