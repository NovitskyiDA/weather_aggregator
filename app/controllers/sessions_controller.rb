class SessionsController < ApplicationController
  def create
    if user && user.authenticate(session_params[:password])
      check_email_confirmation
    else
      render 'new'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_path
  end

  private

  def user
    @user = User.find_by(email: session_params[:email])
  end

  def session_params
    params.require(:session).permit(:email, :password, :remember_me)
  end

  def cookies_auth_token(remember_me)
    if remember_me
      cookies.permanent[:auth_token] = user.auth_token
    else
      cookies[:auth_token] = user.auth_token
    end
  end

  def check_email_confirmation
    if user.email_confirmed
      cookies_auth_token(session_params[:remember_me])
      redirect_to root_path
    else
      flash.now[:error] = 'Please activate your account'
      render 'new'
    end
  end
end
