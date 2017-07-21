class ApplicationController < ActionController::API
  include Response
private
  def authenticate
    head :unauthorized unless User.exists?(token: params[:token])
  end
end
