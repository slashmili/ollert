class AddTagsToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :tags, :json
  end
end
