class JsonWebToken
  # Secret to encode and decode token
  HMAC_SECRET = Rails.application.credentials.secret_key_base || ENV["SECRET_KEY_BASE"]

  def self.encode(payload, exp = 24.hours.from_now)
    # Set expiry to 24 hours from creation time
    payload[:exp] = exp.to_i
    # Sign token with application secret
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    # Get payload; first index in decoded array
    body = JWT.decode(token, HMAC_SECRET, true, { algorithm: "HS256" }).first
    HashWithIndifferentAccess.new body
  rescue JWT::DecodeError => e
    # Raise custom error to be handled by custom handler
    raise ExceptionHandler::InvalidToken, e.message
  end
end
