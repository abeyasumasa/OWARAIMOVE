class ChangeColumnAddNotnullComedians < ActiveRecord::Migration[5.2]
  def change
    change_column_null :comedians, :genre, false
  end
end
