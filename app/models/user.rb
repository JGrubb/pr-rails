class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :role_id

  validates :first_name, :last_name, :presence => true
  validates :role_id, :on => :create
  validate :must_be_valid_role
  
  belongs_to :role

  def must_be_valid_role
    @roles = Role.all
    unless @roles.include?(role_id)
      errors.add :role_id, "must be one of the values from the list"
    end
  end

end
