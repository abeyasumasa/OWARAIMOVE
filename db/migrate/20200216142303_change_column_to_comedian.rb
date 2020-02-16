class ChangeColumnToComedian < ActiveRecord::Migration[5.2]
  def change
    change_column :comedians, :genre, :string, null: true
    change_column :comedians, :twitter_url, :string, null: true
    change_column :comedians, :youtube_url, :string, null: true
    change_column :comedians, :comment, :text
  end
end
