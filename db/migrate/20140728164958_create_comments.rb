class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :card_id, references: :cards, null: false
      t.integer :user_id, references: :users, null: false

      t.timestamps
    end
  end
end
