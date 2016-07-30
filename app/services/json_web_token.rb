# https://jwt.io/introduction/
# https://github.com/jwt/ruby-jwt
#
class JsonWebToken
  class << self
    def issuer
      'iMusics'
    end

    def issued_at
      Time.now.to_i
    end

    def algorithm
      'HS256'
    end

    def password
      Rails.application.secrets.secret_key_base
    end

    def encode(payload)
      payload.merge!(iat: issued_at, iss: issuer)

      JWT.encode(payload, password, algorithm)
    end

    def decode(token)
      decoded_token = JWT.decode(token, password, true, { verify_iat: true, algorithm: algorithm })[0]

      HashWithIndifferentAccess.new(decoded_token)
    rescue
      nil
    end
  end
end
