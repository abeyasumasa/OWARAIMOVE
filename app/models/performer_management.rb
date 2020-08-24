class PerformerManagement < ApplicationRecord
  belongs_to :live
  belongs_to :comedian

  before_destroy :do_not_destroy_perfomer_management_comedian

  private

  # バリデーション(ライブに出演する芸人を１人以下にしたくない)
  def do_not_destroy_perfomer_management_comedian
    if PerformerManagement.where(live_id:live_id).count == 1
      throw :abort
    end
  end
end
