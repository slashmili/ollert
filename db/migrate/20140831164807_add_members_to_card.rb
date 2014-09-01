class AddMembersToCard < ActiveRecord::Migration
  def change
    add_column :cards, :members, :json
  end
end
