class CreateMembership < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :roles_mask, default:0, null: false
      t.integer :board_id, references: :boards, null: false
      t.integer :user_id, references: :users, null: false

      t.timestamps
    end
  end
end
