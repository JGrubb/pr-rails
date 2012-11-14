class ChangeDoNotBuyListToString < ActiveRecord::Migration
  def up
    change_column :retailers, :do_not_buy_list, :string
  end

  def down
    change_column :retailers, :do_not_buy_list, :boolean
  end
end
