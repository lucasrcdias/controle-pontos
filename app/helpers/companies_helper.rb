module CompaniesHelper
  def company_extra_hour_limit(company)
    l(company.extra_hours_limit, format: :short) if company.extra_hours_limit
  end
end
