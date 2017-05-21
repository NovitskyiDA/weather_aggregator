class WeatherInformationsController < ApplicationController
  before_action :authenticate!

  def show
    @forecasts = ForecastPresenter.collection(WeathersService.new(
      location: location,
      days: params[:days]
    ).forecast_info)
  end

  def update
    @weather_information = WeathersService.new(
      location: location
    ).update_weather_information
  end

  private

  def location
    @location ||= Location.joins(:weather_information).find_by!(weather_informations: { id: params[:id] })
  end
end
