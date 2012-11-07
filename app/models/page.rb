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

class Page < ActiveRecord::Base
  attr_accessible :body, :permalink, :title, :protected

  validates :permalink, :uniqueness => true
  validates :title, :body, :presence => true

  def to_param
    permalink
  end
end
