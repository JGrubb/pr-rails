class AddIndexesToTables < ActiveRecord::Migration
  def change

  add_index :locations, :retailer_id, :name => 'retailer_id_index'
  add_index :retailers, :user_id, :name => 'user_id_index'
  
  end
end
