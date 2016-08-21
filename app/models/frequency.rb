class Frequency < ActiveRecord::Base
  validates :days, length: { minimum: 1, message: I18n.t('activerecord.errors.messages.week_days') }
  validates :days, uniqueness: { scope: :company }

  belongs_to :company

  alias_attribute :to_s, :name

  def to_s
    WeekDays.week_days_from_array(days)
  end
end
