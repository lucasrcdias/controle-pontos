class Point < ActiveRecord::Base
  validates :latitude, :longitude, presence: true
  validates_with PointLimitValidator

  belongs_to :worker

  scope :on_month, ->(date) { where(created_at: date.beginning_of_month..date.end_of_month) }
end
