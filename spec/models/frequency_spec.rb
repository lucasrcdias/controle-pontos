require 'spec_helper'

describe Frequency do
  describe "validations" do
    let!(:frequency) { create(:frequency) }

    context "selected one or more week day" do
      it { expect(frequency).to be_valid }
    end

    context "empty week days" do
      before { frequency.days = [] }
      it { expect(frequency).not_to be_valid }
    end

    context "invalid week day" do
      before { frequency.days = [10, 11, 12] }
      it { expect(frequency).not_to be_valid }
    end
  end

  describe "relationships" do
    it { should belong_to(:company) }
  end
end
