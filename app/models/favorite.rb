class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :comedian

  paginates_per 10
  validates :user_id,
            uniqueness: {scope: [:comedian_id]}
end
