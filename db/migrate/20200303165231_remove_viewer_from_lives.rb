class RemoveViewerFromLives < ActiveRecord::Migration[5.2]
  def change
    remove_column :lives, :viewer, :string
  end
end
