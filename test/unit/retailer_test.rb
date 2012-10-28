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

require 'test_helper'

class RetailerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
