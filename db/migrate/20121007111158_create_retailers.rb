class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
      t.string :name
      t.string :training_frequency
      t.string :motivation_with_program
      t.string :informed_of_invasives
      t.boolean :do_not_buy_list
      t.string :customer_inquiry_frequency
      t.text :biggest_challenge
      t.string :educational_content_staff
      t.string :educational_content_customers
      t.string :invasives_in_past_year
      t.text :partnership_gain
      t.string :educational_importance

      t.timestamps
    end
  end
end
