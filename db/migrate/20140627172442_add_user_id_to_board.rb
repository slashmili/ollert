class AddUserIdToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :user_id, :integer, references: :users, null: false, default: 0
  end
end
