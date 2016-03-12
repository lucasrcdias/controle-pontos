require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.has_company?
      dashboard_root_path
    else
      new_company_path
    end
  end

  def authenticate_manager!
    authenticate_user! && current_user.manager?
  end

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end
