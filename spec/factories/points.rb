FactoryGirl.define do
  factory :point do
    association :worker, strategy: :build

    latitude  { "" }
    longitude { "" }
    date      { Date.parse("2016-04-15") }
  end
end
