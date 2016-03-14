require 'spec_helper'

describe User do
  let(:user) { create(:user) }
  let(:company) { create(:company) }

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "relationships" do
    it { should have_one(:manager).dependent(:destroy) }
  end

  describe "#manager?" do
    context "is manager" do
      before { user.update(manager: Manager.new) }

      it { expect(user.manager?).to be true }
    end

    context "isnt manager" do
      it { expect(user.manager?).to be false }
    end
  end

  describe "#worker?" do
    context "is worker" do
      before { user.update(worker: create(:pf_worker)) }

      it { expect(user.worker?).to be true }
    end

    context "isnt worker" do
      it { expect(user.worker?).to be false }
    end
  end

  describe "#has_company?" do
    context "when has company" do
      before { user.update(manager: Manager.new(company: company)) }

      it { expect(user.has_company?).to be true }
    end

    context "when hasnt company" do
      it { expect(user.has_company?).to be false }
    end
  end

  describe "#company" do
    before { user.update(manager: Manager.new(company: company)) }

    it { expect(user.company.fantasy_name).not_to be nil }
    it { expect(user.company.fantasy_name).to eql(company.fantasy_name) }
    it { expect(user.company.social_reason).to eql(company.social_reason) }
    it { expect(user.company.cnpj).to eql(company.cnpj) }
    it { expect(user.company.code).to eql(company.code) }
  end
end
