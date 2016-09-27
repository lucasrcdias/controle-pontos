class PointsKind < EnumerateIt::Base
  associate_values entry: 1, start_interval: 2, end_interval: 3, leave: 4, start_extra_time: 5, leave_extra_time: 6

  def self.values
    [:entry, :start_interval, :end_interval, :leave, :start_extra_time, :leave_extra_time]
  end
end
