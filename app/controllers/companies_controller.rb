class CompaniesController < ApplicationController
  layout "application"

  before_action :authenticate_company_user!

  expose(:company, attributes: :company_params)

  def new
    redirect_to dashboard_index_path and return if current_company_user.company.present?
  end

  def create
    company.company_user = current_company_user
    company.save
    respond_with company, location: root_path
  end

  private

  def company_params
    params.require(:company).permit(:fantasy_name, :social_reason, :cnpj)
  end
end
