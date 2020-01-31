module Api
  module V1
    class AuthenticationsController < ApplicationController
      skip_before_action :authorize_request, only: :create

      def create
        result = Authenticate.call(params: login_params)

        if result.success?
          render json: { token: result.token, exp: result.time,
                         username: result.user_name }, status: :ok
        else
          render json: { error: I18n.t('authentications.error') }, status: :unauthorized
        end
      end

      def destroy
        Rails.cache.redis.setex(request.headers['Authorization'], 24.hours, :expired)
        head :no_content
      end

      private

      def login_params
        params.permit(:username, :password)
      end
    end
  end
end
