class Api::V1::AuthenticationsController < ApplicationController
  before_action :authorize_request, except: :create

  def create
    @user = User.find_by!(username: params[:username])
    if @user.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.zone.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime('%m-%d-%Y %H:%M'),
                     username: @user.username }, status: :ok
    else
      render json: { error: 'Invalid password' }, status: :unauthorized
    end
  end

  def destroy
    Rails.cache.redis.setex(request.headers['Authorization'], 24.hours, :expired)
    head :ok
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
