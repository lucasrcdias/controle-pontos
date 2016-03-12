require 'spec_helper'

describe Company do
  describe 'validations' do
    it { should validate_presence_of(:social_reason) }
    it { should validate_presence_of(:fantasy_name) }
    it { should validate_presence_of(:cnpj) }

    it { should validate_uniqueness_of(:cnpj) }
    it { should validate_uniqueness_of(:code) }
  end

  describe 'relationships' do
    it { should belong_to(:manager) }
    it { should have_many(:roles).dependent(:destroy) }
    it { should have_many(:periods).dependent(:destroy) }
    it { should have_many(:frequencies).dependent(:destroy) }
  end
end
