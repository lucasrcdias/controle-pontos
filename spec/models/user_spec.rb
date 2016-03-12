require 'spec_helper'

describe User do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "relationships" do
    it { have_one(:manager).dependent(:destroy) }
  end

  describe "#manager?" do
    let!(:user) { create(:user) }

    context "is manager" do
      before { user.update(manager: Manager.new) }

      it { expect(user.manager?).to be true }
    end

    context "isnt manager" do
      it { expect(user.manager?).to be false }
    end
  end
end
