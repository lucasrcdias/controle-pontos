module DashboardHelper
  def current_user_greeting
    "Olá, #{current_company_user.name}" if company_user_signed_in?
  end
end
