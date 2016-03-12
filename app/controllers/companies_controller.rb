class CompaniesController < ApplicationController
  layout "application"

  before_action :authenticate_manager!

  expose(:company, attributes: :company_params)

  def new
    redirect_to dashboard_root_path and return if current_user.has_company?
  end

  def create
    company.manager = current_user.manager
    company.save
    respond_with company, location: dashboard_root_path
  end

  private

  def company_params
    params.require(:company).permit(:fantasy_name, :social_reason, :cnpj)
  end
end
