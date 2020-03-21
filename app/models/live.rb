class Live < ApplicationRecord
  # ページネーション（１ページの最大表示件数）
  paginates_per 5

  # 芸人とライブのアソシエーション
  has_many :performer_managements, dependent: :destroy
  has_many :performer_management_comedians, through: :performer_managements, source: :comedian

  # ユーザーとライブのアソシエーション
  has_many :participant_managements, dependent: :destroy
  has_many :participant_management_users, through: :participant_managements, source: :user

  #バリデーション
  validates :title, presence: true, length: {maximum: 255}
  validates :content, presence: true
  validates :place, presence: true, length: {maximum: 255}
  validates :date, presence: true
  validate :start_time_cannot_be_later_than_end_time
  validates :price, presence: true, numericality: {only_integer: true, greater_than: 1, less_than: 10000}

  # scope :week_search, -> (from = Time.now.at_beginning_of_day)(to = (from + 6.day).at_end_of_day){Live.where(date: from...to)}

  private

  def start_time_cannot_be_later_than_end_time
    if start_time > ending_time
      errors.add(:start_time, "は終了日時より後に設定できません")
    end
  end

  # def self.list(parameter)
  #   if parameter[:week_seach] == "true"
  #     from = Time.now.at_beginning_of_day
  #     to = (from + 6.day).at_end_of_day
  #     Live.where(date: from...to)
  #     week_search
  #   end
  # end
end

