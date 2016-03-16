FactoryGirl.define do
  factory :user do
    name  { FFaker::NameBR.name }
    email { FFaker::Internet.email }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
