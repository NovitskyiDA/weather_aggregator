class RegistrationsController < ApplicationController
  def new
    @user ||= User.new
  end

  def create
    @user ||= User.new(user_params)
    if @user.valid? && @user.save
      @user.send_email_confirmation
      redirect_to root_url, notice: 'Please confirm your email address to continue'
    else
      render 'new'
    end
  end

  def confirm_email
    user = User.find_by(confirm_token: params[:id])
    if user
      user.email_activate
      redirect_to new_session_path, notice: 'Your email has been confirmed'
    else
      redirect_to root_url, alert: 'User doesn\'t exist'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
