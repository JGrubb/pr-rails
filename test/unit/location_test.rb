# == Schema Information
#
# Table name: locations
#
#  id          :integer          primary key
#  address1    :string(255)
#  address2    :string(255)
#  city        :string(255)
#  state       :string(255)
#  zip         :string(255)
#  phone       :string(255)
#  retailer_id :integer
#  created_at  :timestamp        not null
#  updated_at  :timestamp        not null
#

require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
