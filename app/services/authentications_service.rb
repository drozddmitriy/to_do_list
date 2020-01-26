class AuthenticationsService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def time
    (Time.zone.now + 24.hours).strftime('%m-%d-%Y %H:%M')
  end

  def token
    JsonWebToken.encode(user_id: user.id)
  end
end
