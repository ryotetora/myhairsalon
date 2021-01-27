class Tweet < ApplicationRecord
  has_one_attached :image
  # activestorageとのアソシエーション

  validates :text, presence: true
  
  belongs_to :user
  has_many :comments
# 各テーブルとのアソシエーション
end
