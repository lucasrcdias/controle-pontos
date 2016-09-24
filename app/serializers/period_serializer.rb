class PeriodSerializer < ActiveModel::Serializer
  attributes :start_at, :finish_at, :interval_start, :interval_finish, :extra_hour_start, :extra_hour_finish

  def extra_hour_start
    object.finish_at + 1.second
  end

  def extra_hour_finish
    extra_hour_start + (object.company.extra_hours_limit.to_i || 2.hours)
  end
end
