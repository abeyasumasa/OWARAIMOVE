class User < ApplicationRecord
  before_validation { email.downcase! }

  # アソシエーション機能
  has_one :comedian, dependent: :destroy

  # ライブ参加機能
  has_many :participant_managements, dependent: :destroy
  has_many :participant_management_lives, through: :participant_managements, source: :live

  # お気に入り機能
  has_many :favorites, dependent: :destroy
  has_many :favorite_comedians, through: :favorites, source: :comedian

  # ページネーション（１ページの最大表示件数）
  paginates_per 10

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable, omniauth_providers: %i(google twitter)
  # イメージアップローダー機能
  mount_uploader :icon, UserImageUploader

  # バリデーション
  validates :name, presence: true, length: {maximum: 30}
  validates :password, presence: true, length: {minimum: 6}, on: :create
  validates :email, presence: true, length: {maximum: 255},
            format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

  # ランダムなuidを作成
  def self.create_unique_string
    SecureRandom.uuid
  end

  # # 外部から取得したユーザー情報を元に、このアプリで使用するユーザーを作成するメソッド
  # def self.find_for_google(auth)
  #   user = User.find_by(email: auth.info.email)
  #   unless user
  #     user = User.new(email: auth.info.email,
  #                     provider: auth.provider,
  #                     uid: auth.uid,
  #                     name: auth.info.name,
  #                     password: Devise.friendly_token[0, 20],
  #     )
  #   end
  #   user.save
  #   user
  # end

  def self.find_for_oauth(auth)
      user = User.where(uid: auth.uid, provider: auth.provider).first

      unless user
        user = User.new(email: auth.info.email,
                        provider: auth.provider,
                        uid: auth.uid,
                        name: auth.info.name,
                        password: Devise.friendly_token[0, 20],
                        )
      end
      user.save
      user
    end

end
