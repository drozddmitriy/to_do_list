class ApplicationController < ActionController::API
  before_action :authorize_request
  attr_reader :current_user
  include Error::ErrorHandler

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = JsonWebToken.decode(header)
    @current_user = User.find(decoded[:user_id])
  end
end
