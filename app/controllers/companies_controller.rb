class CompaniesController < ApplicationController
  layout "application"

  before_action :authenticate_manager!

  expose(:company, attributes: :company_params)

  def new
    return redirect_to dashboard_root_path if current_user.has_company?
  end

  def create
    company.manager = current_user.manager
    company.save
    respond_with company, location: dashboard_root_path
  end

  def update
    company.save
    respond_with company, location: dashboard_root_path
  end

  private

  def company_params
    params.require(:company).permit(:fantasy_name, :social_reason, :cnpj, :latitude, :longitude, :radius, :extra_hours_limit)
  end
end
