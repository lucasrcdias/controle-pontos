require 'spec_helper'

describe Worker do
  describe "validations" do
    it { should validate_presence_of(:kind) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:document) }
    it { should validate_presence_of(:admitted_at) }
    it { should validate_uniqueness_of(:code) }
    it { should validate_uniqueness_of(:document) }

    context "pf worker" do
      let(:pf_worker) { build(:pf_worker) }

      it { expect(pf_worker).to be_valid }
    end

    context "pj worker" do
      let(:pj_worker) { build(:pj_worker) }

      it { expect(pj_worker).to be_valid }
    end
  end

  describe "relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:role) }
    it { should belong_to(:period) }
    it { should belong_to(:company) }
    it { should belong_to(:frequency) }
  end
end
