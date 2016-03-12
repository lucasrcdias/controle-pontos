require 'spec_helper'

describe User do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "relationships" do
    it { have_one(:manager).dependent(:destroy) }
  end
end
