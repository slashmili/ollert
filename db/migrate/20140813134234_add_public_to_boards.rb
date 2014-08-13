class AddPublicToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :public, :boolean, default: false
  end
end
