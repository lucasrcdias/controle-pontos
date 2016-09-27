FactoryGirl.define do
  factory :worker do
    association :user,      strategy: :build
    association :role,      strategy: :build
    association :period,    strategy: :build
    association :company,   strategy: :build
    association :frequency, strategy: :build

    admitted_at { Date.new }
    internal_id { 1 }

    factory :pf_worker do
      kind { WorkerKind::PF }
      document { '62735257223' }
    end

    factory :pj_worker do
      kind { WorkerKind::PJ }
      document { '48972755000184' }
    end
  end
end
