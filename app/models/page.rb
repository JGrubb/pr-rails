class Page < ActiveRecord::Base
  attr_accessible :body, :permalink, :title, :protected

  validates :permalink, :uniqueness => true

  def to_param
    permalink
  end
end
