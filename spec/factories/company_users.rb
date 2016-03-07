FactoryGirl.define do
  factory :company_users do
    association :company, strategy: :build

    name FFaker::NameBR.name

    email FFaker::Internet.email
    password 'password'
    password_confirmation 'password'
  end

end
