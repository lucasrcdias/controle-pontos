FactoryGirl.define do
  factory :managers do
    association :user, strategy: :build
    association :company, strategy: :build
  end
end
