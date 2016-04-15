class PeriodUniquenessValidator < ActiveModel::Validator
  def validate(record)
    equal_record_present = Period.where({
      start_at: record.start_at,
      finish_at: record.finish_at,
      interval_start: record.interval_start,
      interval_finish: record.interval_finish,
      company: record.company
    }).exists?

    record.errors.add(:base, I18n.t('activerecord.errors.models.period.base.model_uniqueness')) if equal_record_present
  end
end
