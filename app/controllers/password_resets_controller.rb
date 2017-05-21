class PasswordResetsController < ApplicationController
  before_action :user, only: %i(edit update)

  def create
    @user = User.find_by(email: params[:password_reset][:email])
    if @user
      @user.send_password_reset
      redirect_to root_path, notice: 'Check your email to reset password'
    else
      redirect_to root_path, notice: 'User with this email doesn\'t exist'
    end
  end

  def update
    if user && user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, notice: 'Password reset has expired'
    elsif user && user.update(user_params)
      redirect_to root_path, notice: 'Password has been reset'
    else
      render 'edit'
    end
  end

  private

  def user
    @user ||= User.find_by(password_reset_token: params[:id])
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
