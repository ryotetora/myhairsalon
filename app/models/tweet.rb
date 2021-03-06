class Tweet < ApplicationRecord
  has_one_attached :image
  # activestorageとのアソシエーション

  validates :text, presence: true
  
  belongs_to :user
  has_many :comments
# 各テーブルとのアソシエーション

  def self.search(search)
    if search != ""
      # 何かしら検索された時
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
