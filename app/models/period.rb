class Period < ActiveRecord::Base
  validates :start_at, :finish_at, :interval_start, :interval_finish, presence: true
  belongs_to :company

  def workload
    (finish_at.hour - start_at.hour) - interval_duration
  end

  def interval_duration
    interval_finish.hour - interval_start.hour
  end
end
