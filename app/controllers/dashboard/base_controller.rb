require 'application_responder'

class Dashboard::BaseController < ApplicationController
  layout 'dashboard'

  before_action :authenticate_manager!
  before_action :verify_company

  def verify_company
    redirect_to new_company_path unless user_signed_in? && current_user.has_company?
  end
end
