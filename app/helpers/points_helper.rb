module PointsHelper
  PointsKind.values.each do |value|
    define_method("#{value}_date") do |date|
      point   = Point.send("#{value}_by_date", date)
      content = if point
        l(point.created_at, format: :short)
      else
        "-"
      end

      content_tag(:td, content, class: range_class(point))
    end
  end

  def range_class(point)
    "in-range" if point.present? && point.in_company_range?

    "out-of-range"
  end
end
