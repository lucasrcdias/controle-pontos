class Dashboard::ResponsibilitiesController < Dashboard::BaseController
  expose(:responsibilities) { current_company_user.company.responsibilities }
  expose(:responsibility, attributes: :responsibility_params)

  def create
    if responsibility.save
      respond_with responsibility, location: [:dashboard, :responsibilities]
    else
      respond_with responsibility, location: new_dashboard_responsibility_path
    end
  end

  def destroy
    if responsibility.destroy
      respond_with responsibility, location: dashboard_responsibilities_path
    end
  end

  def update
    if responsibility.save
      respond_with responsibility, location: dashboard_responsibilities_path
    else
      respond_with responsibility, location: edit_dashboard_responsibility_path
    end
  end

  protected

  def responsibility_params
    params.require(:responsibility).permit!
  end
end
