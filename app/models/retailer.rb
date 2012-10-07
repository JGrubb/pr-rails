class Retailer < ActiveRecord::Base
  attr_accessible :biggest_challenge, :customer_inquiry_frequency, 
                  :do_not_buy_list, :educational_content_customers, 
                  :educational_content_staff, :educational_importance, 
                  :informed_of_invasives, :invasives_in_past_year, 
                  :motivation_with_program, :name, 
                  :partnership_gain, :training_frequency,
                  :number_of_stores

  validates :biggest_challenge, :customer_inquiry_frequency, 
            :do_not_buy_list, :educational_content_customers, 
            :educational_content_staff, :educational_importance, 
            :informed_of_invasives, :invasives_in_past_year, 
            :motivation_with_program, :name, 
            :partnership_gain, :training_frequency, 
            :number_of_stores, 
            :presence => true 

  serialize :educational_content_staff
  serialize :educational_content_customers
  serialize :invasives_in_past_year
            
  EDUCATIONAL_CONTENT = {
   1 => 'Print materials and handouts',
   2 => 'Online materials and handouts',
   3 => 'Online videos',
   4 => 'Live workshops',
   5 => 'Online training and webinars'
  }

  CUSTOMER_INQUIRY_OPTIONS = [
    'More than once a week',
    'More than once a month',
    'Rarely',
    'Never'
  ]

  TRAINING_FREQUENCY_OPTIONS = [
    'At weekly meetings',
    'At monthly meetings',
    'At quarterly meetings',
    'Once a year'
  ]

  MOTIVATION_OPTIONS = [
    'Very much so',
    'Somewhat',
    'Not really',
    'Very much so, and the same is true for our customers'
  ]

  INVASIVES_OPTIONS = {
    1 => "Brooms (Bridal veil, French, Spanish, Scotch, Portugese)",
    2 => "Green Fountain Grass",
    3 => "Pampas Grass",
    4 => "Periwinkle (Vinca major)",
    5 => "Highway Iceplant"
  }
  
  INFORMED_OPTIONS = [
    'Very informed',
    'Somewhat informed',
    'Not very informed'
  ]

  EDUCATIONAL_IMPORTANCE_OPTIONS = [
    "Very important",
    "Somewhat important",
    "Not important"
  ]
  
end
