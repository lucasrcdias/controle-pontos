class PointLimitValidator < ActiveModel::Validator
  MAX_POINTS_PER_DAY = 4

  def validate(record)
    today           = record.created_at.beginning_of_day..record.created_at.end_of_day
    same_day_points = Point.where(created_at: today).count

    record.errors.add(:base, I18n.t('activerecord.errors.models.point.base.limit_reached')) if same_day_points >= MAX_POINTS_PER_DAY
  end
end
