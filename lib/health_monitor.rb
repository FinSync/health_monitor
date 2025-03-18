require "health_monitor/version"
require "health_monitor/engine"

module HealthMonitor
  mattr_accessor :additional_checks
  @@additional_checks = []

  def self.setup
    yield self
  end
end
