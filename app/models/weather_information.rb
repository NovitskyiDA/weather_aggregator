class WeatherInformation < ApplicationRecord
  belongs_to :location

  validates :description, :icon, :current_temp, :temp_max, :temp_min,
            :humidity, :pressure, :wind_speed, :wind_degree, :location_id,
            presence: true

  def self.global_update
    WeatherInformation.joins(:location).all.each do |record|
      WeathersService.new(location: record.location).update_weather_information
    end
  end
end
