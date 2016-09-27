class PeriodSerializer < ActiveModel::Serializer
  attributes :periods

  def periods
    [
      start_at,
      interval_start,
      interval_finish,
      finish_at,
      extra_hour_start,
      extra_hour_finish
    ]
  end

  def start_at
    {
      index: PointsKind::ENTRY,
      label: I18n.t("enumerations.points_kind.entry"),
      time: object.start_at
    }
  end

  def interval_start
    {
      index: PointsKind::START_INTERVAL,
      label: I18n.t("enumerations.points_kind.start_interval"),
      time: object.interval_start
    }
  end

  def interval_finish
    {
      index: PointsKind::END_INTERVAL,
      label: I18n.t("enumerations.points_kind.end_interval"),
      time: object.interval_finish
    }
  end

  def finish_at
    {
      index: PointsKind::LEAVE,
      label: I18n.t("enumerations.points_kind.leave"),
      time: object.finish_at
    }
  end

  def extra_hour_start
    {
      index: PointsKind::START_EXTRA_TIME,
      label: I18n.t("enumerations.points_kind.start_extra_time"),
      time: set_extra_hour_start
    }
  end

  def extra_hour_finish
    {
      index: PointsKind::LEAVE_EXTRA_TIME,
      label: I18n.t("enumerations.points_kind.leave_extra_time"),
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
