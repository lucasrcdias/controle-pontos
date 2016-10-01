require 'spec_helper'

describe Point do
  let(:point) { build(:point) }

  describe "validations" do
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
  end

  describe "realtionships" do
    it { should belong_to(:worker) }
  end

  describe "#in_company_range?" do
    context "when point was saved in company range" do
      before do
        point.latitude  = 63.55213
        point.longitude = 129.42514

        point.worker.company.latitude  = 20.00277
        point.worker.company.longitude = 67.97980
      end

      it { expect(point.in_company_range?).to be false }
    end

    context "when point was saved in company range" do
      before do
        point.latitude  = point.worker.company.latitude
        point.longitude = point.worker.company.longitude
      end

      it { expect(point.in_company_range?).to be true }
    end
  end
end
