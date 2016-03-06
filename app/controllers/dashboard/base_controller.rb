require 'application_responder'

class Dashboard::BaseController < ApplicationController
  layout 'dashboard'

  before_action :authenticate_company_user!
end
