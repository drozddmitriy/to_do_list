class JsonWebToken
  EXP_PERIOD = 24.hours
  SECRET_KEY = Rails.application.credentials.secret_key_base

  def self.encode(payload, exp = EXP_PERIOD.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    raise JWT::DecodeError if Rails.cache.redis.keys.include?(token)

    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end
