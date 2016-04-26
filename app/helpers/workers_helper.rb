module WorkersHelper
  def admitted_at(worder)
    return if worker.admitted_at.nil?

    l worker.admitted_at, format: :short_without_time
  end
end
