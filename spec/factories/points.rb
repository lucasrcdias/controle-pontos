FactoryGirl.define do
  factory :point do
    association :worker, strategy: :build

    latitude  { FFaker::Geolocation.lat }
    longitude { FFaker::Geolocation.lng }
    date      { Date.parse("2016-04-15") }
    time      { Time.parse('08:00') }
  end
end
