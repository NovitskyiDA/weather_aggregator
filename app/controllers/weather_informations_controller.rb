class WeatherInformationsController < ApplicationController
  before_action :authenticate!

  def update
    @weather_information = WeathersService.new(
      location: location
    ).update_weather_information
  end

  private

  def location
    WeatherInformation.find(params[:id]).location
  end
end
