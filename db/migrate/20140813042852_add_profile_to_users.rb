class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :initials, :string, null: false
    add_column :users, :avatar, :string
    add_index :users, :username, unique: true
  end
end
