class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    remove_column :users, :role_id
  end
end
