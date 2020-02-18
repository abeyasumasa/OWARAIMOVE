class AddUserRefComedians < ActiveRecord::Migration[5.2]
  def change
    add_reference :comedians, :user, foreign_key: true
  end
end
