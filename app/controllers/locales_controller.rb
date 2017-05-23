class LocalesController < ApplicationController
  def update
    session[:locale] = params[:id]
    redirect_to :back
  end
end
