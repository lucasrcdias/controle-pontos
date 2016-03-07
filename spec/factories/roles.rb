FactoryGirl.define do
  factory :role do
    association :company, strategy: :build
    name FFaker::NameBR.name
  end

end
