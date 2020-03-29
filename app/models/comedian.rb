class Comedian < ApplicationRecord
  before_validation { email.downcase! }

  # 芸人とユーザーのアソシエーション
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  # 芸人とライブのアソシエーション
  has_many :performer_managements, dependent: :destroy
  has_many :performer_management_lives, through: :performer_managements, source: :live

  # ユーザーとのアソシエーション
  belongs_to :user

  # ページネーション（１ページの最大表示件数）
  paginates_per 9

  # アップローダー
  mount_uploader :combination_icon, ComedianImageUploader

  # バリデーション
  validates :combination_name, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 255},
            format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :twitter_url, length: {maximum: 255}
  validates :youtube_url, length: {maximum: 255}
  validates :genre, presence: true
  validates :twitter_url, format: /\A#{URI::regexp(%w(http https))}\z/, allow_blank: true
  validates :youtube_url, format: /\A#{URI::regexp(%w(http https))}\z/, allow_blank: true
end
