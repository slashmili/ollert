class AddPositionToList < ActiveRecord::Migration
  def change
    add_column :lists, :position, :float, default: 1.0
  end
end
