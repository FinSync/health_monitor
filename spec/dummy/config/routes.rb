Rails.application.routes.draw do
  mount HealthMonitorLb::Engine => '/'
end
