class LocationsController < ApplicationController
  before_action :authenticate!
  before_action :location, only: %i(create destroy)

  def index
    @locations = current_user.locations.includes(:weather_information)
  end

  def create
    if location && current_user.locations.include?(location)
      head :ok
    elsif location
      current_user.locations << location
    else
      @location = current_user.locations.create(location_params)
    end

    @weather_information = WeathersService.new(
      location: @location
    ).find_or_create_weather_information
  end

  def destroy
    current_user.locations.delete(location) if current_user.locations.include?(location)
  end

  private

  def location_params
    params.require(:location).permit(:country, :country_code, :city)
  end

  def weather_information_params
    WeathersService.new(location: @location).find_or_create_weather_information
  end

  def location
    @location ||= Location.find_by(location_id || location_params)
  end

  def location_id
    params[:id] ? { id: params[:id] } : false
  end
end
