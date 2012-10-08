class Location < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :phone, :state, :zip

  validates :address1, :city, :state, :zip, :phone, :presence => true

  belongs_to :retailer
end
