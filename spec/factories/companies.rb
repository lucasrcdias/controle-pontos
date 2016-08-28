FactoryGirl.define do
  factory :company do
    social_reason FFaker::NameBR.name
    fantasy_name FFaker::NameBR.name
    cnpj '64249243000140'
  end
end
