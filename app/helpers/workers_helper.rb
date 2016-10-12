module WorkersHelper
  def admitted_at(worder)
    return if worker.admitted_at.nil?

    l worker.admitted_at, format: :short_without_time
  end

  def parse_worked_hours(hours)
    return "0 horas"        if hours.blank?
    return "#{hours / 1.hour} horas" if (hours / 1.hour) >= 1

    "#{hours / 1.minute} minutos"
  end
end
