module RetailersHelper
  def can_admin_retailer(retailer, user)
    if user.retailer_id = retailer.id && user.role == User::ROLE_OPTIONS[0]
      true
    end
    if user.admin?
      true
    end
  end
end
