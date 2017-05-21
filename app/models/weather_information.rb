class WeatherInformation < ApplicationRecord
  belongs_to :location

  validates :description, :icon, :current_temp, :temp_max, :temp_min,
            :humidity, :pressure, :wind_speed, :wind_degree, :location_id,
            presence: true
end
