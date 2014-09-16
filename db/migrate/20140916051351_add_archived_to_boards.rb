class AddArchivedToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :archived, :boolean, default: false
  end
end
