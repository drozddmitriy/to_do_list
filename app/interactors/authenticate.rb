class Authenticate
  include Interactor

  def call
    context.user = User.find_by!(username: context.params[:username])
    context.fail! unless authenticated?

    time
    token
    user_name
  end

  def authenticated?
    context.user.authenticate(context.params[:password])
  end

  def time
    context.time = (Time.zone.now + JsonWebToken::EXP_PERIOD)
  end

  def token
    context.token = JsonWebToken.encode(user_id: context.user.id)
  end

  def user_name
    context.user_name = context.user.username
  end
end
