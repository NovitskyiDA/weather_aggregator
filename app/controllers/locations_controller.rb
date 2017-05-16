class LocationsController < ApplicationController
  before_action :authenticate!

  def index
    @locations = current_user.locations
  end

  def create
    @location = current_user.locations.create(location_params)
  end

  private

  def location_params
    params.require(:location).permit(:country, :city)
  end
end
