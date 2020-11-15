module DashboardsHelper


  def Super_admin?
    current_user.categorie === "Super-administrateur"
  end

  def Admin?
    current_user.categorie === "Administrateur"
  end


end
