require 'spec_helper'

describe Manager do
  describe "relationships" do
    it { should belong_to(:user) }
    it { should have_one(:company) }
  end
end
