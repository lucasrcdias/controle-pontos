class Point < ActiveRecord::Base
  validates :latitude, :longitude, :date, presence: true
  validates_with PointLimitValidator

  belongs_to :worker

  scope :on_month, ->(date) { where(date: date.beginning_of_day..date.end_of_day) }
end
