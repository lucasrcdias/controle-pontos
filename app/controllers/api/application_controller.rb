class API::ApplicationController < ActionController::Base
  before_action :authenticate!
  helper_method :current_user

  protect_from_forgery with: :null_session

  def current_user
    @current_user ||= AuthenticateRequest.new(request.headers).user
  end

  private

  def authenticate!
    render json: { session: { errors: I18n.t('activerecord.errors.models.session.invalid_token') } }, status: :unauthorized unless current_user
  end
end
