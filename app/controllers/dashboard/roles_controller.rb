class Dashboard::RolesController < Dashboard::BaseController
  expose(:roles) { current_company_user.company.roles }
  expose(:role, attributes: :role_params)

  def create
    role.save
    respond_with role, location: [:dashboard, :roles]
  end

  def destroy
    role.destroy
    respond_with role, location: [:dashboard, :roles]
  end

  def update
    role.save
    respond_with role, location: [:dashboard, :roles]
  end

  protected

  def role_params
    params.require(:role).permit!
  end
end
