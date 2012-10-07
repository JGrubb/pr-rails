class AddUserInfoToRetailer < ActiveRecord::Migration
  def change
    add_column :retailers, :updated_by, :integer
    add_column :retailers, :created_by, :integer
  end
end
