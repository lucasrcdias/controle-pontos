require 'spec_helper'

RSpec.describe Company, type: :model do
  context "validations" do
    it { should validate_presence_of(:social_reason) }
    it { should validate_presence_of(:fantasy_name) }
    it { should validate_presence_of(:cnpj) }

    it { should validate_uniqueness_of(:cnpj) }
    it { should validate_uniqueness_of(:code) }
  end
end
