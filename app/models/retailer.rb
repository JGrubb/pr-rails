class Retailer < ActiveRecord::Base
  attr_accessible :biggest_challenge, :customer_inquiry_frequency, :do_not_buy_list, :educational_content_customers, :educational_content_staff, :educational_importance, :informed_of_invasives, :invasives_in_past_year, :motivation_with_program, :name, :partnership_gain, :training_frequency

  validates :biggest_challenge, :customer_inquiry_frequency, :do_not_buy_list, :educational_content_customers, :educational_content_staff, :educational_importance, :informed_of_invasives, :invasives_in_past_year, :motivation_with_program, :name, :partnership_gain, :training_frequency, :presence => true 

  EDUCATIONAL_CONTENT = [
    'Print materials and handouts',
    'Online materials and handouts',
    'Online videos',
    'Live workshops',
    'Online training and webinars'
  ]

end
