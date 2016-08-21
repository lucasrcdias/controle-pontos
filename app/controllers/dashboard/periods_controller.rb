class Dashboard::PeriodsController < Dashboard::BaseController
  expose(:periods) { current_user.company.periods }
  expose(:period, attributes: :period_params)

  add_breadcrumb I18n.t("titles.dashboard.periods.index"), :dashboard_periods_path
  add_breadcrumb :period, -> c {}, only: :edit
  add_breadcrumb I18n.t("titles.dashboard.periods.new"), -> c {}, only: :new

  def create
    period.save
    respond_with period, location: [:dashboard, :periods]
  end

  def update
    period.save
    respond_with period, location: [:dashboard, :periods]
  end

  def destroy
    period.destroy
    respond_with period, location: [:dashboard, :periods]
  end

  protected

  def period_params
    params.require(:period).permit!
  end
end
