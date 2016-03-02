require 'spec_helper'

describe CompanyUser do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:role) }
  end

  describe 'relationships' do
    it { should belongs_to(:company_user) }
  end
end
