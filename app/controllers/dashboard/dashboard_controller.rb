class Dashboard::DashboardController < Dashboard::BaseController
  add_breadcrumb I18n.t("titles.dashboard.index"), :dashboard_root_path
end
