class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  # 各テーブルとのアソシエーション
end
