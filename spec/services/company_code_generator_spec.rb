require 'spec_helper'

describe CompanyCodeGenerator do
  let(:company) { create(:company) }

  describe "#generate_code" do
    it { expect(company.code).not_to eql(CompanyCodeGenerator.generate_code) }
  end
end
