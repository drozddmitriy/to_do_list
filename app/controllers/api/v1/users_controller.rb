module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authorize_request

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:username, :password, :password_confirmation)
      end
    end
  end
end
