class Dashboard::RolesController < Dashboard::BaseController
  expose(:roles) { current_user.company.roles }
  expose(:role, attributes: :role_params)

  add_breadcrumb I18n.t("titles.dashboard.roles.index"), :dashboard_roles_path
  add_breadcrumb :role, -> c {}, only: :edit
  add_breadcrumb I18n.t("titles.dashboard.roles.new"), -> c {}, only: :new

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
