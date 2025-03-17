require_relative "lib/health_monitor/version"

Gem::Specification.new do |spec|
  spec.name        = "health_monitor"
  spec.version     = HealthMonitor::VERSION
  spec.authors     = ["FINSYNC, Inc."]
  spec.email       = ["finsync-ops@finsync.com"]
  spec.homepage    = "https://www.finsync.com"
  spec.summary     = "Add a health check route to your Rails app."
  spec.description = "Copyright (c) 2025 FINSYNC, Inc. All Rights Reserved."

  spec.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.7", ">= 6.1.7.1"
  spec.add_dependency "pg", "~> 1.2"
end
