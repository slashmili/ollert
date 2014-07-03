class AddPositionToCard < ActiveRecord::Migration
  def change
    add_column :cards, :position, :float
  end
end
