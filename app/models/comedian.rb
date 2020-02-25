class Comedian < ApplicationRecord
  # アップローダー
  mount_uploader :combination_icon, ImageUploader

  # 芸人登録者の管理のため
  belongs_to :user

  # 芸人とユーザーのアソシエーション
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  # 芸人とライブのアソシエーション
  has_many :performer_managements, dependent: :destroy
  has_many :performer_management_lives, through: :performer_managements, source: :live

  # バリデーション
  validates :combination_name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :genre, length: { maximum: 255 }
  validates :twitter_url, length: { maximum: 255 }
  validates :youtube_url, length: { maximum: 255 }
  validates :comment, presence: true
  
end
