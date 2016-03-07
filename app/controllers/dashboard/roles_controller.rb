class Dashboard::RolesController < Dashboard::BaseController
  expose(:roles) { current_company_user.company.roles }
  expose(:role, attributes: :role_params)

  def create
    if role.save
      respond_with role, location: [:dashboard, :roles]
    else
      respond_with role, location: new_dashboard_role_path
    end
  end

  def destroy
    if role.destroy
      respond_with role, location: dashboard_roles_path
    end
  end

  def update
    if role.save
      respond_with role, location: [:dashboard, :roles]
    else
      respond_with role, location: edit_dashboard_role_path
    end
  end

  protected

  def role_params
    params.require(:role).permit!
  end
end
