class Favorite < ApplicationRecord
  # ページネーション（１ページの最大表示件数）
  paginates_per 10
  
  belongs_to :user
  belongs_to :comedian
end
