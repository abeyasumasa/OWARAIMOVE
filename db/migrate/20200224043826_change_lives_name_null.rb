class ChangeLivesNameNull < ActiveRecord::Migration[5.2]
  def change
    change_column :lives, :viewer, :string, null: true
  end
end
