require 'spec_helper'

describe Point do
  describe "validations" do
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
  end

  describe "realtionships" do
    it { should belong_to(:worker) }
  end
end
