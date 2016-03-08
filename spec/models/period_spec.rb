require 'spec_helper'

describe Period do
  let(:period) { create(:period) }

  describe "validations" do
    it { should validate_presence_of(:start_at) }
    it { should validate_presence_of(:finish_at) }
    it { should validate_presence_of(:interval_start) }
    it { should validate_presence_of(:interval_finish) }
  end

  describe "relationships" do
    it { should belong_to(:company) }
  end

  describe "#interval_duration" do
    it { expect(period.interval_duration).to eq(1.0) }
  end

  describe "#workload" do
    it { expect(period.workload).to eq(9.0) }
  end
end
