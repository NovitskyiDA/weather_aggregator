class ForecastPresenter
  def initialize(object)
    @object = object
  end

  def self.collection(forecasts)
    forecasts.map(&method(:new))
  end

  def date
    Time.at(object['dt']).strftime('%b %d %A')
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

  def description
    object['weather'][0]['main']
  end

  def icon
    object['weather'][0]['icon']
  end

  private

  attr_reader :object
end
