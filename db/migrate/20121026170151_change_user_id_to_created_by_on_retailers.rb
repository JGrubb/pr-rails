class ChangeUserIdToCreatedByOnRetailers < ActiveRecord::Migration
  def up
    rename_column :retailers, :user_id, :created_by_user
  end

  def down
    rename_column :retailers, :created_by_user, :user_id
  end
end
