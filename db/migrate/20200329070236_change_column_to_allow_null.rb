class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :comedians, :comment, true
  end
end
