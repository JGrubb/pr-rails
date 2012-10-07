class AddNumberOfStoresToRetailers < ActiveRecord::Migration
  def change
    add_column :retailers, :number_of_stores, :integer
  end
end
