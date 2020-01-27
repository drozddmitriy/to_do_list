module Error
  module ErrorHandler
    def self.included(error_handler)
      error_handler.class_eval do
        rescue_from CanCan::AccessDenied, with: :can_can_error
        rescue_from ActiveRecord::RecordNotFound, with: :active_record_error
        rescue_from JWT::DecodeError, with: :jwt_error
      end
    end

    private

    def can_can_error(_error)
      render json: { error: I18n.t('can_can.error') }, status: :forbidden
    end

    def active_record_error(error)
      render json: { error: error.message }, status: :not_found
    end

    def jwt_error(_error)
      render json: { error: I18n.t('jwt.error') }, status: :unauthorized
    end
  end
end
