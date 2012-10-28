# == Schema Information
#
# Table name: users
#
#  id                     :integer          primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :timestamp
#  remember_created_at    :timestamp
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :timestamp
#  last_sign_in_at        :timestamp
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :timestamp
#  confirmation_sent_at   :timestamp
#  unconfirmed_email      :string(255)
#  created_at             :timestamp        not null
#  updated_at             :timestamp        not null
#  admin                  :boolean          default(FALSE)
#  first_name             :string(255)
#  last_name              :string(255)
#  role                   :string(255)
#  verified               :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  scope :of_role, lambda { |role| where("role = ?", role) }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :role, :admin

  validates :first_name, :last_name, :presence => true, :on => :update
  validate :must_be_valid_role, :on => :create
  validates_presence_of :role, :on => :create

  has_and_belongs_to_many :retailers

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
