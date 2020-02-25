class Live < ApplicationRecord
  has_many :performer_managements, dependent: :destroy
  has_many :performer_management_comedians, through: :performer_managements, source: :comedian
end
