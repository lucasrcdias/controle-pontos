class Point < ActiveRecord::Base
  validates :latitude, :longitude, :date, :time, presence: true

  belongs_to :worker
end
