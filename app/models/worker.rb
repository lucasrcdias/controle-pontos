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
    points_per_month = points.on_month(date)

    entry_hour          = points_per_month.entry.sum("extract(hour from created_at)")
    leave_hour          = points_per_month.leave.sum("extract(hour from created_at)")
    start_interval_hour = points_per_month.start_interval.sum("extract(hour from created_at)")
    end_interval_hour   = points_per_month.end_interval.sum("extract(hour from created_at)")

    ((leave_hour - entry_hour) - (end_interval_hour - start_interval_hour)).to_i
  end

  def extra_time_by_month(date)
    points_per_month = points.on_month(date)

    return 0 if points_per_month.start_extra_time.blank? && points_per_month.leave_extra_time.blank?

    start_extra_time = points_per_month.start_extra_time.sum("extract(hour from created_at)")
    last_extra_time  = points_per_month.leave_extra_time.sum("extract(hour from created_at)")

    (last_extra_time - start_extra_time).to_i
  end
end
