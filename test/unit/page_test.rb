# == Schema Information
#
# Table name: pages
#
#  id         :integer          primary key
#  title      :string(255)
#  body       :text
#  permalink  :string(255)
#  created_at :timestamp        not null
#  updated_at :timestamp        not null
#  protected  :boolean          default(FALSE)
#

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
