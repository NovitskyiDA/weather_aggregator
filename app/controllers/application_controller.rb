class ApplicationController < ActionController::Base
  helper_method :current_user

  protect_from_forgery with: :exception

  private

  def authenticate!
    redirect_to new_session_path unless authenticated?
  end

  def authenticated?
    cookies[:auth_token] && current_user
  end

  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
  end
end
