class ApplicationController < ActionController::Base
  protect_from_forgery

  private 

  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "You must be admin to access that"
      redirect_to root_path
    end
  end

  def require_manager
    authenticate_user!
    unless current_user.admin? || current_user.roles == "manager"
      flash[:alert] = "You must be a nursery manager to access this action"
      redirect_to root_path
    end
  end
  
end
