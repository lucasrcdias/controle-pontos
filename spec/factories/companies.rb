FactoryGirl.define do
  factory :company do
    social_reason { FFaker::NameBR.name }
    fantasy_name  { FFaker::NameBR.name }
    latitude      { FFaker::Geolocation.lat }
    longitude     { FFaker::Geolocation.lng }
    cnpj          { '64249243000140' }
    radius        { 50 }
  end
end
