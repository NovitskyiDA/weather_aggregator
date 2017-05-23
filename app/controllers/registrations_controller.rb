class RegistrationsController < ApplicationController
  def new
    @user ||= User.new
  end

  def create
    @user ||= User.new(user_params)
    if @user.valid? && @user.save
      @user.send_email_confirmation
      redirect_to root_url, notice: I18n.t('notice.confirm_email')
    else
      render 'new'
    end
  end

  def confirm_email
    user = User.find_by(confirm_token: params[:id])
    if user
      user.email_activate
      redirect_to new_session_path, notice: I18n.t('notice.success_email_confirm')
    else
      redirect_to root_url, notice: I18n.t('notice.user_not_found')
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
