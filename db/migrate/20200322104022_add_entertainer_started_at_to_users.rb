class AddEntertainerStartedAtToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :entertainer_started_at, :date
  end
end
