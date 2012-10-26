class CraeateRetailersUsersTable < ActiveRecord::Migration
  def up
    create_table :retailers_users do |t|
      t.references :retailer
      t.references :user
    end
    add_index :retailers_users, [:retailer_id, :user_id]
    add_index :retailers_users, :user_id
  end

  def down
    drop_table :retailers_users
  end
end
