set :environment, 'production'

every :hour do
  rake 'weather_informations global_update'
end
