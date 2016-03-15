module ApplicationHelper
  def dispatcher_route
    controller_name = controller.class.name.gsub!(/::|Controller$/, '')
    "#{controller_name}##{action_name}"
  end
end
