namespace :weather_informations do
  desc 'Update all weather informations'
  task global_update: :environment do
    WeatherInformation.global_update
  end
end
