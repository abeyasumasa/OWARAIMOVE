class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :icon ,ImageUploader
  has_many :comedians
  has_many :favorites, dependent: :destroy
  validates :name,  presence: true, length: { maximum: 30 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true, length: { maximum: 255 },
                             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
