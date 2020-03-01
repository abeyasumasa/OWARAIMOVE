class AddOauthFromUsers < ActiveRecord::Migration[5.2]
  # OAuth機能追加のためカラムを追加
  def up
    add_column :users, :uid, :string, null: false, default: ""
    add_column :users, :provider, :string, null: false, default: ""

  # Trackable
    add_column :users, :sign_in_count, :integer, null: false, default: 0
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :inet
    add_column :users, :last_sign_in_ip, :inet
    add_index :users, [:uid, :provider], unique: true
  end

  def down
    remove_columns :users, :provider, :uid
    remove_index :users, name: :index_users_on_uid_and_provider
  end
end
