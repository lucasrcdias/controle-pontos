class PeriodSerializer < ActiveModel::Serializer
  attributes :start_at, :finish_at, :interval_start, :interval_finish, :extra_hour_start, :extra_hour_finish

  def start_at
    {
      index: PointsKind::ENTRY,
      time: object.start_at
    }
  end

  def interval_start
    {
      index: PointsKind::START_INTERVAL,
      time: object.interval_start
    }
  end

  def interval_finish
    {
      index: PointsKind::END_INTERVAL,
      time: object.interval_finish
    }
  end

  def finish_at
    {
      index: PointsKind::LEAVE,
      time: object.finish_at
    }
  end

  def extra_hour_start
    {
      index: PointsKind::START_EXTRA_TIME,
      time: set_extra_hour_start
    }
  end

  def extra_hour_finish
    {
      index: PointsKind::LEAVE_EXTRA_TIME,
      time: set_extra_hour_finish
    }
  end

  def set_extra_hour_start
    object.finish_at + 1.second
  end

  def set_extra_hour_finish
    set_extra_hour_start + (object.company.extra_hours_limit.to_i || 2.hours)
  end
end
