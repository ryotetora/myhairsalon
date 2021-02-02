class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :img
  # activestorageとのアソシエーション
  validates :nickname, :salon_name, :like_style, :salon_hp, :prefecture, :phone, :img,presence: true

  has_many :tweets
  has_many :comments
  # 各テーブルとのアソシエーション
end
