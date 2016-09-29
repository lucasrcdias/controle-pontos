module DashboardHelper
  def current_user_greeting
    "Olá, #{current_user.first_name}" if user_signed_in?
  end

  def filtered?
    'filtered' if params[:q].present?
  end
end
