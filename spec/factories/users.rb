FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| FFaker::InternetSE.user_name_variant_long[0..8].sub('.', '_') + n.to_s }
    email { "#{username}@#{FFaker::Internet.domain_name}" }
    password '12341234'
    auth_token { SecureRandom.urlsafe_base64 }
  end
end
