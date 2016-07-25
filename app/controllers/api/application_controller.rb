class API::ApplicationController < ActionController::Base
  before_action :authenticate
  helper_method :current_user

  protect_from_forgery with: :null_session

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by(auth_token: token)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: 'Bad Credentials', status: 401
  end

  def current_user
    @current_user
  end
end
