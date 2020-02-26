class Live < ApplicationRecord
  has_many :performer_managements, dependent: :destroy
  has_many :performer_management_comedians, through: :performer_managements, source: :comedian

  has_many :participant_managements, dependent: :destroy
  has_many :participant_management_users, through: :participant_managements, source: :user
end
