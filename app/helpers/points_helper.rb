module PointsHelper
  PointsKind.values.each do |value|
    define_method("#{value}_hour") do |date|
      point   = Point.send("#{value}_on_date", date)
      content = if point
        l(point.created_at, format: :short)
      else
        "-"
      end

      content_tag :td do
        concat range_icon(point)
        concat content
      end
    end
  end

  def range_icon(point)
    style = "point-out-of-range"
    title = "Além da distância permitida"

    if point.present? && point.in_company_range?
      style = "point-in-range"
      title = "Dentro da distância permitida"
    end

    content_tag(:span, "", class: style, data: { toggle: "tooltip", placement: "bottom" }, title: title)
  end
end
