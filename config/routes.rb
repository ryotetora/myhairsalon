Rails.application.routes.draw do
  root to: "tweets#index"
  # アクセスがあればindexにとばす
end
