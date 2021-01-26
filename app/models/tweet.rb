class Tweet < ApplicationRecord
  has_one_attached :image
  # activestorageとのアソシエーション

  validates :text, presence: true
  
  belongs_to :user
  # user:tweet 1:多
end
