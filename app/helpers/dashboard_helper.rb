module DashboardHelper
  def current_user_greeting
    'Olá, Lucas'
    # "Olá, #{current_user.name}" if user_signed_in?
  end
end
