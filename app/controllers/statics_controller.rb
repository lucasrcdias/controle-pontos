class StaticsController < ApplicationController
  layout 'landing'

  def home
    if user_signed_in?
      return redirect_to dashboard_root_path if current_user.manager?

      redirect_to worker_confirmation_path
    end
  end
end
