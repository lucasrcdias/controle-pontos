class PeriodSerializer < ActiveModel::Serializer
  attributes :start_at, :finish_at, :interval_start, :interval_finish
end
