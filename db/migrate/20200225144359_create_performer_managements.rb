class CreatePerformerManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :performer_managements do |t|
      t.integer :comedian_id
      t.integer :live_id

      t.timestamps
    end
  end
end
