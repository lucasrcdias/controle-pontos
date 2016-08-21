class Dashboard::FrequenciesController < Dashboard::BaseController
  expose(:frequencies) { current_user.company.frequencies }
  expose(:frequency, attributes: :frequency_params)

  add_breadcrumb I18n.t("titles.dashboard.frequencies.index"), :dashboard_frequencies_path
  add_breadcrumb :frequency, -> c {}, only: :edit
  add_breadcrumb I18n.t("titles.dashboard.frequencies.new"), -> c {}, only: :new

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
