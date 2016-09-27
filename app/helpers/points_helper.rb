module PointsHelper
  PointsKind.values.each do |value|
    define_method("#{value}_date") do |date|
      record = Point.send("#{value}_by_date", date)
      if record
        l(record.created_at, format: :short)
      else
        "-"
      end
    end
  end
end
