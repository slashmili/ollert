class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title, null: false
      t.integer :list_id, references: :lists, null: false

      t.timestamps
    end
  end
end
