Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  # アクセスがあればindexにとばす
  resources :users, only: [:edit, :update]
end
