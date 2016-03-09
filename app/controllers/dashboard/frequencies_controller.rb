class Dashboard::FrequenciesController < Dashboard::BaseController
  expose(:frequencies) { current_company_user.company.frequencies }
  expose(:frequency, attributes: :frequency_params)

  def create
    if frequency.save
      respond_with frequency, location: [:dashboard, :frequencies]
    else
      respond_with frequency, location: new_dashboard_frequency_path
    end
  end

  def update
    if frequency.save
      respond_with frequency, location: [:dashboard, :frequencies]
    else
      respond_with frequency, location: edit_dashboard_frequency_path
    end
  end

  def destroy
    frequency.destroy
    respond_with frequency, location: [:dashboard, :frequencies]
  end

  protected

  def frequency_params
    params.require(:frequency).permit!
  end
end
