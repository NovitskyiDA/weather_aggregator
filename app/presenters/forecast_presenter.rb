class ForecastPresenter
  def initialize(object)
    @object = object
  end

  def self.collection(forecasts)
    forecasts.map(&method(:new))
  end

  def date
    Time.at(object['dt']).strftime('%v').tr('-', ' ')
  end

  def day_temp
    object['temp']['day'].round
  end

  def night_temp
    object['temp']['night'].round
  end

  def max_temp
    object['temp']['max'].round
  end

  def min_temp
    object['temp']['min'].round
  end

  def description
    object['weather'][0]['main']
  end

  def icon
    object['weather'][0]['icon']
  end

  def wind_speed
    object['speed']
  end

  def wind_degree
    object['deg']
  end

  def humidity
    object['humidity']
  end

  def pressure
    object['pressure'].round
  end

  private

  attr_reader :object
end
