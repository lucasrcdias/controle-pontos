require 'spec_helper'

describe CompanyUser do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { should have_one(:company).dependent(:destroy) }
  end
end
