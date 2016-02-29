class CompaniesController < ApplicationController
  layout "application"

  expose(:company, attributes: :company_params)

  def create
    company.save
    respond_with company, location: root_path
  end

  private

  def company_params
    params.require(:company).permit(:fantasy_name, :social_reason, :cnpj)
  end
end
