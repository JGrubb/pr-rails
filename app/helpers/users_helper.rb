module UsersHelper

  def user_role(user)
    if user.admin?
      "Admin"
    else
      user.role
    end
  end

end
