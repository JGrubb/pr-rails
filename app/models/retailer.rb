# == Schema Information
#
# Table name: retailers
#
#  id                            :integer          not null, primary key
#  name                          :string(255)
#  training_frequency            :string(255)
#  motivation_with_program       :string(255)
#  informed_of_invasives         :string(255)
#  do_not_buy_list               :boolean
#  customer_inquiry_frequency    :string(255)
#  biggest_challenge             :text
#  educational_content_staff     :text
#  educational_content_customers :text
#  invasives_in_past_year        :string(255)
#  partnership_gain              :text
#  educational_importance        :string(255)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  number_of_stores              :integer
#  created_by_user               :integer
#

class Retailer < ActiveRecord::Base

  has_many :users
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

  validates :number_of_stores, :numericality => { :greater_than_or_equal_to => 1,
                                                  :only_integer             => true }

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
   'Online training and webinars',
   'Not sure'
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
    'Very much so, and the same is true for our customers',
	'Very much so',
    'Somewhat',
    'Not really'
  ]

  INVASIVES_OPTIONS = [
    "Brooms (Bridal veil, French, Spanish, Scotch, Portugese)",
    "Green Fountain Grass",
    "Pampas Grass",
    "Periwinkle (Vinca major)",
    "Highway Iceplant",
	"None of these"
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
    if self.educational_content_staff.nil?
      ''
    elsif EDUCATIONAL_CONTENT.include?(self.educational_content_staff.last)
      nil
    else
      self.educational_content_staff.last
    end
  end

  def ecc_other
    if self.educational_content_customers.nil?
      ''
    elsif EDUCATIONAL_CONTENT.include?(self.educational_content_customers.last)
      nil
    else
      self.educational_content_customers.last
    end
  end
end
