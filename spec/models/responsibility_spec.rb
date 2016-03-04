require 'spec_helper'

describe Responsibility do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { should belong_to(:company) }
  end
end
