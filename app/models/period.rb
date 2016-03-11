class Period < ActiveRecord::Base
  validates :start_at, :finish_at, :interval_start, :interval_finish, presence: true
  belongs_to :company

  def workload
    to_hour(finish_at - start_at) - interval_duration
  end

  def interval_duration
    to_hour(interval_finish - interval_start)
  end

  def time_humanize(time)
    if time < 1
      "#{(time * 1.minutes).to_i} minutos"
    else
      "#{time} horas"
    end
  end

  private

  def to_hour(seconds)
    seconds / 1.hour
  end
end
