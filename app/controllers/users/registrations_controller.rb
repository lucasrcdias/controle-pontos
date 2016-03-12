class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]

  def create
    super do |resource|
      resource.manager = Manager.new if params[:manager].present?
    end
  end

  protected

  def user_params
    [:name, :email, :password, :password_confirmation]
  end

  def user_sign_up_params
    user_params.concat([:role])
  end

  def user_update_params
    user_params.concat([:current_password])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(user_sign_up_params)
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(user_update_params)
    end
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    new_company_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    success_sign_up_path
  end
end
