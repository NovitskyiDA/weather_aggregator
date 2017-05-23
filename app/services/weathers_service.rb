require 'open_weather'

class WeathersService < BaseService
  def initialize(location:, days: 1)
    @location = location
    @days = days.to_i
  end

  def find_or_create_weather_information
    weather_information
  end

  def update_weather_information
    update_weather
  end

  def forecast_info
    openweathermap_forecast
  end

  private

  attr_reader :location, :days

  def weather_information
    location.weather_information ? update_weather : create_weather
  end

  def create_weather
    WeatherInformation.create(weather_params(openweathermap_info, apixu_info).merge(location_id: location.id))
  end

  def update_weather
    location.weather_information.update(weather_params(openweathermap_info, apixu_info))
    location.weather_information
  end

  def weather_params(openweathermap, apixu)
    { description: openweathermap['weather'][0]['main'],
      icon: openweathermap['weather'][0]['icon'],
      current_temp: average([openweathermap['main']['temp'], apixu.fetch('current', {}).fetch('temp_c', nil)]),
      temp_max: openweathermap['main']['temp_max'].round,
      temp_min: openweathermap['main']['temp_min'].round,
      humidity: average([openweathermap['main']['humidity'], apixu.fetch('current', {}).fetch('humidity', nil)]),
      pressure: average([openweathermap['main']['pressure'], apixu.fetch('current', {}).fetch('pressure_mb', nil)]),
      wind_speed: openweathermap['wind']['speed'],
      wind_degree: average([openweathermap['wind']['deg'], apixu.fetch('current', {}).fetch('wind_degree', nil)]) }
  end

  def openweathermap_info
    OpenWeather::Current.city(location_city, openweathermap_request_params)
  end

  def openweathermap_forecast
    OpenWeather::ForecastDaily.city(location_city, openweathermap_request_params.merge(cnt: days.between?(1, 16) ? days : 1))['list']
  end

  def apixu_info
    Apixu::Client.new.current(location.city)
  rescue
    {}
  end

  def average(array)
    array.compact.any? ? (array.compact.reduce(:+) / array.length).round : 0
  end

  def openweathermap_request_params
    { units: 'metric', APPID: ENV['OPENWEATHERMAP_API_KEY'] }
  end

  def location_city
    "#{location.city}, #{location.country_code}"
  end
end
