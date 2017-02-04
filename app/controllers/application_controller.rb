class ApplicationController < ActionController::Base
  helper_method :current_user

  protect_from_forgery with: :exception

  private

  def authenticate!
    redirect_to new_session_path unless authenticated?
  end

  def authenticated?
    session[:auth_token] && current_user
  end

  def current_user
    @current_user ||= User.find_by(auth_token: session[:auth_token]) if session[:auth_token]
  end
end
