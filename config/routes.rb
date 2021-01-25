Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  # アクセスがあればindexにとばす
  resources :users, only: [:edit, :update, :show]
  resources :tweets, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
