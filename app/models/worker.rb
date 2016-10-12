class Worker < ActiveRecord::Base
  validates :document, :admitted_at, :user, :role, :period, :company, :frequency, presence: true
  validates :document, uniqueness: true
  validates :document, cpf:  { if: :pf? }
  validates :document, cnpj: { if: :pj? }

  has_enumeration_for :kind, with: WorkerKind, create_helpers: true, required: true

  belongs_to :user, inverse_of: :worker
  belongs_to :role
  belongs_to :period
  belongs_to :company
  belongs_to :frequency

  has_many :points, dependent: :destroy

  accepts_nested_attributes_for :user

  def has_password?
    user.sign_in_count.zero? && user.reset_password_token.present?
  end

  def hours_per_month(date)
    total_hours      = 0
    points_per_month = points.on_month(date)

    points_per_month.group_by(&:day).each do |date, points|
      entry          = point_from_array(points, PointsKind::ENTRY)
      leave          = point_from_array(points, PointsKind::LEAVE)
      start_interval = point_from_array(points, PointsKind::START_INTERVAL)
      end_interval   = point_from_array(points, PointsKind::END_INTERVAL)

      return if entry.nil? || leave.nil? || start_interval.nil? || end_interval.nil?

      total_hours += (start_interval.created_at - entry.created_at) - (start_interval.created_at - end_interval.created_at)
    end

    total_hours.to_i
  end

  def extra_time_per_month(date)
    total_hours      = 0
    points_per_month = points.on_month(date)

    points_per_month.group_by(&:day).each do |date, points|
      start_extra_time = point_from_array(points, PointsKind::START_EXTRA_TIME)
      leave_extra_time = point_from_array(points, PointsKind::LEAVE_EXTRA_TIME)

      return if start_extra_time.nil? || leave_extra_time.nil?

      total_hours += leave_extra_time.created_at - start_extra_time.created_at
    end

    total_hours.to_i
  end

  private

  def point_from_array(points, kind)
    point_found = nil

    points.each do |point|
      point_found = point if point.kind == kind
    end

    point_found
  end
end
