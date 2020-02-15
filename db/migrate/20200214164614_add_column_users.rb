class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null:false
    add_column :users, :icon, :string
    add_column :users, :admin, :boolean, null:false, default: 0
    add_column :users, :entertainer, :boolean, null:false, default: 0
  end
end
