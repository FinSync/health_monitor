Rails.application.routes.draw do
  mount HealthMonitor::Engine => '/'
end
