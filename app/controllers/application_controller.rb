class ApplicationController < ActionController::Base
  helper_method :current_user

  before_action :set_locale

  protect_from_forgery with: :exception

  private

  def authenticate!
    redirect_to new_session_path, notice: I18n.t('notice.authenticate') unless authenticated?
  end

  def authenticated?
    cookies[:auth_token] && current_user
  end

  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
  end

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
