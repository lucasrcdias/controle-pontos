class Point < ActiveRecord::Base
  validates :latitude, :longitude, :date, presence: true

  belongs_to :worker
end
