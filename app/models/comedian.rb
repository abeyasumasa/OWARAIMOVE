class Comedian < ApplicationRecord
  mount_uploader :combination_icon, ComedianImageUploader
  
end
