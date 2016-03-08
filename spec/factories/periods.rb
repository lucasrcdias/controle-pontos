FactoryGirl.define do
  factory :period do
    association :company, strategy: :build

    start_at        Time.parse("08:00")
    finish_at       Time.parse("18:00")
    interval_start  Time.parse("12:00")
    interval_finish Time.parse("13:00")
  end
end
