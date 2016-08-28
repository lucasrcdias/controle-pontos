require 'spec_helper'

describe Company do
  describe 'validations' do
    it { should validate_presence_of(:social_reason) }
    it { should validate_presence_of(:fantasy_name) }
    it { should validate_presence_of(:cnpj) }

    it { should validate_uniqueness_of(:cnpj) }

    describe "validate cnpj" do
      let(:company) { build(:company) }

      context "valid cnpj" do
        it { expect(company.valid?).to be true }
      end

      context "invalid cnpj" do
        before { company.cnpj = '00invalid11cnpj' }

        it { expect(company.valid?).to be false }
      end
    end
  end

  describe 'relationships' do
    it { should belong_to(:manager) }
    it { should have_many(:roles).dependent(:destroy) }
    it { should have_many(:periods).dependent(:destroy) }
    it { should have_many(:workers).dependent(:destroy) }
    it { should have_many(:frequencies).dependent(:destroy) }
  end
end
