class ApplicationController < ActionController::API
  include ErrorHandler

  before_action :authorize_request

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = JsonWebToken.decode(header)
    @current_user = User.find(decoded[:user_id])
  end

  attr_reader :current_user
end
