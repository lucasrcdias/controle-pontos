require 'spec_helper'

describe Period do
  describe "validations" do
    it { should validate_presence_of(:start_at) }
    it { should validate_presence_of(:finish_at) }
    it { should validate_presence_of(:interval) }
  end

  describe "relationships" do
    it { should belong_to(:company) }
  end
end
