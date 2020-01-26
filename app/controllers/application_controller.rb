class ApplicationController < ActionController::API
  before_action :authorize_request
  attr_reader :current_user

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = JsonWebToken.decode(header)
    @current_user = User.find(decoded[:user_id])
  end

  rescue_from CanCan::AccessDenied do |_error|
    render json: { error: I18n.t('can_can.error') }, status: :forbidden
  end

  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: { error: error.message }, status: :not_found
  end

  rescue_from JWT::DecodeError do |_e|
    render json: { e: I18n.t('jwt.error') }, status: :unauthorized
  end
end
