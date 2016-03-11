FactoryGirl.define do
  factory :frequency do
    association :company, strategy: :build

    days [WeekDays.list.sample, WeekDays.list.sample, WeekDays.list.sample].uniq
  end
end
