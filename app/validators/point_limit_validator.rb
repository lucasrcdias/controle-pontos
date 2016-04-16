class PointLimitValidator < ActiveModel::Validator
  MAX_POINTS_PER_DAY = 4

  def validate(record)
    today           = record.date.beginning_of_day..record.date.end_of_day
    same_day_points = Point.where(date: today).count

    record.errors.add(:base, I18n.t('activerecord.errors.models.point.base.limit_reached')) if same_day_points >= MAX_POINTS_PER_DAY
  end
end
