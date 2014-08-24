class AddUniqueBoardUserToMembership < ActiveRecord::Migration
  def change
    add_index :memberships, [:board_id, :user_id], unique: true
  end
end
