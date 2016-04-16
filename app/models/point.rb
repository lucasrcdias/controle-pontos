class Point < ActiveRecord::Base
  validates :latitude, :longitude, :date, presence: true
  validates_with PointLimitValidator

  belongs_to :worker
end
