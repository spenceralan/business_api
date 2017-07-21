class ApplicationController < ActionController::API

private
  def authenticate
    head :unauthorized unless User.exists?(token: params[:token])
  end
end
