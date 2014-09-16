class AddUserIndexToBoards < ActiveRecord::Migration
  def change
    change_table :boards do |t|
      t.remove_index :title
    end
    add_index :boards, [:title, :user_id], unique: true
  end
end
