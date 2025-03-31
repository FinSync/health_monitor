HealthMonitorLb::Engine.routes.draw do
  get '/health' => 'health#index'
end
