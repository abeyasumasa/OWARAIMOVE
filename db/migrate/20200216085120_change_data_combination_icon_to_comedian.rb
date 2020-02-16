class ChangeDataCombinationIconToComedian < ActiveRecord::Migration[5.2]
  def change
    change_column :comedians, :combination_icon, :text
  end
end
