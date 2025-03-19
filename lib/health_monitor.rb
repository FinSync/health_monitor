require "health_monitor/version"
require "health_monitor/engine"

module HealthMonitor
  mattr_accessor :additional_health_checks
  @@additional_health_checks = []

  def self.setup
    yield self
  end
end
