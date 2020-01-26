class Api::V1::AuthenticationsController < ApplicationController
  before_action :authorize_request, except: :create

  def create
    @user = User.find_by!(username: params[:username])
    if @user.authenticate(params[:password])
      auth = AuthenticationsService.new(@user)
      render json: { token: auth.token, exp: auth.time,
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
