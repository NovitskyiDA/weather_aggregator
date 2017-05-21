require 'open_weather'
require 'apixu'

class WeathersService < BaseService
  def find_or_create_weather_information
    weather_information
  end

  def update_weather_information
    update_weather
  end

  private

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
      current_temp: average([openweathermap['main']['temp'] + apixu['current']['temp_c']]),
      temp_max: openweathermap['main']['temp_max'].round,
      temp_min: openweathermap['main']['temp_min'].round,
      humidity: average([openweathermap['main']['humidity'], apixu['current']['humidity']]),
      pressure: average([openweathermap['main']['pressure'], apixu['current']['pressure_mb']]),
      wind_speed: openweathermap['wind']['speed'],
      wind_degree: average([openweathermap['wind']['deg'], apixu['current']['wind_degree']]) }
  end

  def openweathermap_info
    OpenWeather::Current.city("#{location.city}, #{location.country_code}", units: 'metric', APPID: ENV['OPENWEATHERMAP_API_KEY'])
  end

  def apixu_info
    Apixu::Client.new.current(location.city)
  end

  def average(array)
    (array.reduce(:+) / array.length).round
  end
end
