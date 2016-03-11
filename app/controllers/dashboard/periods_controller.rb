class Dashboard::PeriodsController < Dashboard::BaseController
  expose(:periods) { current_company_user.company.periods }
  expose(:period, attributes: :period_params)

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
