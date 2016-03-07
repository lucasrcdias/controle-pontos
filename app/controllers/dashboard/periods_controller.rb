class Dashboard::PeriodsController < Dashboard::BaseController
  expose(:periods)
  expose(:period, attributes: :period_params)

  def create
    if period.save
      respond_with period, location: [:dashboard, :periods]
    else
      respond_with period, location: new_dashboard_period_path
    end
  end

  def update
    if period.save
      respond_with period, location: [:dashboard, :periods]
    else
      respond_with period, location: edit_dashboard_period_path
    end
  end

  def destroy
    if period.destroy
      respond_with period, location: [:dashboard, :periods]
    end
  end

  protected

  def period_params
    params.require(:period).permit!
  end
end
