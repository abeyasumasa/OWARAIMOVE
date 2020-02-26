class CreateParticipantManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :participant_managements do |t|
      t.integer :user_id
      t.integer :live_id

      t.timestamps
    end
  end
end
