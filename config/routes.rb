Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  # アクセスがあればindexにとばす
  resources :users, only: [:edit, :update, :show]
  resources :tweets do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
    # どの投稿に対してか区別できるようにネスト
  end
end
