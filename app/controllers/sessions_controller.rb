class SessionsController < ApplicationController
  def create
    if user && user.authenticate(session_params[:password])
      cookies_auth_token(session_params[:remember_me])
      redirect_to root_path
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
    @user = User.find_by(username: session_params[:username])
  end

  def session_params
    params.require(:session).permit(:username, :password, :remember_me)
  end

  def cookies_auth_token(remember_me)
    if remember_me
      cookies.permanent[:auth_token] = user.auth_token
    else
      cookies[:auth_token] = user.auth_token
    end
  end
end
