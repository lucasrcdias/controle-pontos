require 'spec_helper'

describe Manager do
  describe "relationships" do
    it { belong_to(:user) }
    it { have_one(:company) }
  end
end
