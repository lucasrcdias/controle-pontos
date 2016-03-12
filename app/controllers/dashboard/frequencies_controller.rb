class Dashboard::FrequenciesController < Dashboard::BaseController
  expose(:frequencies) { current_user.company.frequencies }
  expose(:frequency, attributes: :frequency_params)

  def create
    frequency.save
    respond_with frequency, location: [:dashboard, :frequencies]
  end

  def update
    frequency.save
    respond_with frequency, location: [:dashboard, :frequencies]
  end

  def destroy
    frequency.destroy
    respond_with frequency, location: [:dashboard, :frequencies]
  end

  protected

  def frequency_params
    return if params[:frequency].nil?

    params.require(:frequency).permit(days: [])
  end
end
