require 'spec_helper'

describe Frequency do
  describe "validations" do
    it { should validate_length_of(:days) }
  end

  describe "relationships" do
    it { should belong_to(:company) }
  end
end
