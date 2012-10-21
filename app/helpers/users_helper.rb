module UsersHelper

  def user_role
    if current_user.admin?
      "Admin"
    else
      current_user.role
    end
  end

end
