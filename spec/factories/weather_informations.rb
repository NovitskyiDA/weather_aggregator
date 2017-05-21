FactoryGirl.define do
  factory :weather_information do
    description { FFaker::Lorem.word }
    icon { FFaker::Lorem.word }
    current_temp 20
    temp_max 25
    temp_min 15
    humidity 80
    pressure 1000
    wind_speed 2.5
    wind_degree 55
  end
end
