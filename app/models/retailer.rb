class Retailer < ActiveRecord::Base

  belongs_to :user
  has_many :locations
  accepts_nested_attributes_for :locations, :allow_destroy => true

  attr_accessible :biggest_challenge, :customer_inquiry_frequency, 
                  :do_not_buy_list, :educational_content_customers, 
                  :educational_content_staff, :educational_importance, 
                  :informed_of_invasives, :invasives_in_past_year, 
                  :motivation_with_program, :name, 
                  :partnership_gain, :training_frequency,
                  :number_of_stores, :locations_attributes

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

# Gets rid of weird blank string in serialized array.
  before_validation do |model|
    model.educational_content_staff.reject!(&:empty?) if model.educational_content_staff
    model.educational_content_customers.reject!(&:empty?) if model.educational_content_customers
    model.invasives_in_past_year.reject!(&:empty?) if model.invasives_in_past_year
  end

  EDUCATIONAL_CONTENT = [
   'Print materials and handouts',
   'Online materials and handouts',
   'Online videos',
   'Live workshops',
   'Online training and webinars'
  ]
  
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

  INVASIVES_OPTIONS = [
    "Brooms (Bridal veil, French, Spanish, Scotch, Portugese)",
    "Green Fountain Grass",
    "Pampas Grass",
    "Periwinkle (Vinca major)",
    "Highway Iceplant"
  ]
  
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

  def ecs_other
    if EDUCATIONAL_CONTENT.include?(self.educational_content_staff.last)
      nil
    else
      self.educational_content_staff.last
    end
  end
end
