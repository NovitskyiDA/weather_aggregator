FactoryGirl.define do
  factory :location do
    image 'http://imgur.com/rv7OLfq'
    city { FFaker::Address.city }
    country { FFaker::Address.country }
    country_code { FFaker::Address.country_code }
  end
end
