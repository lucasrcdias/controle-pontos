class Frequency < ActiveRecord::Base
  validates :days, length: { minimum: 1, message: I18n.t('activerecord.errors.messages.week_days') }

  belongs_to :company

  def to_s
    WeekDays.week_days_from_array(days)
  end
end
