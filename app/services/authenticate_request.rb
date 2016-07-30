class AuthenticateRequest
  attr_accessor :headers

  def initialize(headers = {})
    @headers = headers
  end

  def user
    @user ||= User.find_by(id: decoded_token[:user_id]) if decoded_token
  end

  def decoded_token
    @decoded_token ||= JsonWebToken.decode(auth_token)
  end

  def auth_token
    return headers['Authorization'].split(' ').last if headers['Authorization'].present?
  end
end
