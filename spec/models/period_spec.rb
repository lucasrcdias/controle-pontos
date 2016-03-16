require 'spec_helper'

describe Period do
  let(:period) { build(:period) }

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

  describe "#time_humanize" do
    context "less than a hour" do
      before { period.update(interval_start: Time.parse('08:50'), interval_finish: Time.parse('9:10')) }

      it { expect(period.time_humanize(period.interval_duration)).to eql('20 minutos') }
    end

    context "more or equal a hour" do
      it { expect(period.time_humanize(period.workload)).to eql('9.0 horas') }
    end
  end
end
