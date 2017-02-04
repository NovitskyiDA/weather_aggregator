class SessionsController < ApplicationController
  def create
    if user && user.authenticate(session_params[:password])
      session[:auth_token] = user.auth_token
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    session.delete :auth_token
    reset_session
    redirect_to root_path
  end

  private

  def user
    @user = User.find_by(username: session_params[:username])
  end

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
