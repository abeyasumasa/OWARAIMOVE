class AddIndexToFavoritesUserIdComedianId < ActiveRecord::Migration[5.2]
  def change
    add_index :favorites, [:user_id, :comedian_id], unique: true
  end
end
