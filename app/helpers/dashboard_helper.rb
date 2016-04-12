module DashboardHelper
  def current_user_greeting
    "Olá, #{current_user.name}" if user_signed_in?
  end

  def filtered?
    'filtered' if params[:q].present?
  end
end
