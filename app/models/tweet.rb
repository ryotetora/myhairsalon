class Tweet < ApplicationRecord
  has_one_attached :image
  # activestorageとのアソシエーション

  validates :text, presence: true
end
