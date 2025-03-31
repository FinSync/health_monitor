require "health_monitor_lb/version"
require "health_monitor_lb/engine"

module HealthMonitorLb
  mattr_accessor :additional_health_checks
  @@additional_health_checks = []

  def self.setup
    yield self
  end
end
