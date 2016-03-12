FactoryGirl.define do
  factory :manager do
    association :user, strategy: :build
  end
end
