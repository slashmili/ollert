class AddTagsToCard < ActiveRecord::Migration
  def change
    add_column :cards, :tags, :json
  end
end
