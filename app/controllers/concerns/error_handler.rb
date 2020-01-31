module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from CanCan::AccessDenied, with: :can_can_error
    rescue_from ActiveRecord::RecordNotFound, with: :active_record_error
    rescue_from JWT::DecodeError, with: :jwt_error
  end

  def can_can_error
    render json: { error: I18n.t('errors.can_can') }, status: :forbidden
  end

  def active_record_error(error)
    render json: { error: error.message }, status: :not_found
  end

  def jwt_error
    render json: { error: I18n.t('errors.jwt') }, status: :unauthorized
  end
end
