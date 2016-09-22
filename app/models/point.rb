class Point < ActiveRecord::Base
  validates :latitude, :longitude, presence: true
  validates_with PointLimitValidator

  has_enumeration_for :kind, with: PointsKind, create_scopes: true, create_helpers: true, required: true

  belongs_to :worker

  scope :on_month, -> (date) { where(created_at: date.beginning_of_month..date.end_of_month) }

  def day
    created_at.to_date
  end

  class << self
    PointsKind.values.each do |value|
      define_method("#{value}_by_date") do |date|
        send(value).where("extract(day from points.created_at) = ?", date.day).first
      end
    end
  end
end
