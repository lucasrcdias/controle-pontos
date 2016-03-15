require 'spec_helper'

describe Worker do
  describe "validations" do
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:kind) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:document) }
    it { should validate_presence_of(:admitted_at) }

    context "pf worker" do
      let(:pf_worker) { create(:pf_worker) }

      it { expect(pf_worker).to be_valid }
    end

    context "pj worker" do
      let(:pj_worker) { create(:pj_worker) }

      it { expect(pj_worker).to be_valid }
    end
  end
end
