class Comedian < ApplicationRecord
  mount_uploader :combination_icon, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :combination_name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :genre, length: { maximum: 255 }
  validates :twitter_url, length: { maximum: 255 }
  validates :youtube_url, length: { maximum: 255 }
  validates :comment, presence: true
end
