class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # イメージアップローダー機能
  mount_uploader :icon ,ImageUploader
  # アソシエーション機能
  has_many :comedians
  # ライブ参加機能
  has_many :participant_managements, dependent: :destroy
  has_many :participant_management_lives, through: :participant_managements, source: :live
  # お気に入り機能
  has_many :favorites, dependent: :destroy
  has_many :favorite_comedians, through: :favorites, source: :comedian
  # バリデーション
  validates :name,  presence: true, length: { maximum: 30 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true, length: { maximum: 255 },
                             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
