FactoryGirl.define do
  factory :manager do
    association :user, strategy: :build
    association :company, strategy: :build
  end
end
