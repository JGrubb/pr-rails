class AddUserInfoToRetailer < ActiveRecord::Migration
  def change
    add_column :retailers, :user_id, :integer
  end
end
