require 'spec_helper'

class DummyPeriod < ActiveRecord::Base
  self.table_name = :periods

  belongs_to :company

  validates_with PeriodUniquenessValidator
end

describe PeriodUniquenessValidator do
  let(:company) { create(:company) }
  let(:period) do
    DummyPeriod.create({
      start_at: Time.parse("08:00"),
      finish_at: Time.parse("18:00"),
      interval_start: Time.parse("12:00"),
      interval_finish: Time.parse("13:00"),
      company: company
    })
  end

  it "should not accept repeated records" do
    period

    repeated_period = DummyPeriod.new({
      start_at: Time.parse("08:00"),
      finish_at: Time.parse("18:00"),
      interval_start: Time.parse("12:00"),
      interval_finish: Time.parse("13:00"),
      company: company
    })

    expect(repeated_period).not_to be_valid
    expect(repeated_period.errors[:base]).to include(I18n.t('activerecord.errors.models.period.base.model_uniqueness'))
  end
end
