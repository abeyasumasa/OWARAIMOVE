class Comedian < ApplicationRecord
    validates :email, presence: true, length: { maximum: 255 },
                             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
