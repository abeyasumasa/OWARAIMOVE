class CreateComedians < ActiveRecord::Migration[5.2]
  def change
    create_table :comedians do |t|
      t.string :combination_name, null:false
      t.string :email, null:false
      t.string :genre, null:false
      t.string :twitter_url, null:false
      t.string :youtube_url, null:false
      t.string :combination_icon
      t.string :comment, null:false
    end
  end
end
