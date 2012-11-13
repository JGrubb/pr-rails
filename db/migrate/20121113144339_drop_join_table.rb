class DropJoinTable < ActiveRecord::Migration
  def up
    drop_table :retailers_users
    add_column :users, :retailer_id, :integer
    add_index :users, :retailer_id
  end

  def down
    add_table :retailers_users do |t|
      t.integer :retailer_id
      t.integer :user_id
    end
    add_index :retailers_users, [:retailer_id, :user_id]
    add_index :retailers_users, :user_id
    remove_column :users, :retailer_id
    remove_index :users, :retailer_id
  end
end
