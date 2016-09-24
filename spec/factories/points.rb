FactoryGirl.define do
  factory :point do
    association :worker, strategy: :build

    latitude   { FFaker::Geolocation.lat }
    longitude  { FFaker::Geolocation.lng }
    created_at { DateTime.parse("2016-04-15") }
  end
end
