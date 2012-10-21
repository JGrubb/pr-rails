class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :role, :admin

  validates :first_name, :last_name, :presence => true
  validate :must_be_valid_role, :on => :create
  validates_presence_of :role, :on => :create

  has_many :retailers

  def must_be_valid_role
    unless ROLE_OPTIONS.include?(role)
      errors.add :role, "must be one of the values from the list"
    end
  end

  def full_name
    if first_name.nil? || last_name.nil?
      "Please edit your profile details."
    else
      "#{first_name} #{last_name}"
    end
  end

  ROLE_OPTIONS = [
    'Retailer Manager',
    'Retailer Employee'
  ]  
end
