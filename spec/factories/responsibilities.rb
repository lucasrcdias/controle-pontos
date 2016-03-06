FactoryGirl.define do
  factory :responsibility do
    association :company, strategy: :build
    name FFaker::NameBR.name
  end

end
