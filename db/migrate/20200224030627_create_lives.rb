class CreateLives < ActiveRecord::Migration[5.2]

  def change
    create_table :lives do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :place, null: false
      t.datetime :date, null: false
      t.time :start_time
      t.time :ending_time
      t.integer :price, null: false
      t.string :viewer, null: false

      t.timestamps
    end
  end

end

