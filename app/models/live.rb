class Live < ApplicationRecord
  # ページネーション（１ページの最大表示件数）
  paginates_per 10
  
  has_many :performer_managements, dependent: :destroy
  has_many :performer_management_comedians, through: :performer_managements, source: :comedian

  has_many :participant_managements, dependent: :destroy
  has_many :participant_management_users, through: :participant_managements, source: :user
end
