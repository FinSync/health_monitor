require_relative "lib/health_monitor/version"

Gem::Specification.new do |spec|
  spec.name        = "health_monitor"
  spec.version     = HealthMonitor::VERSION
  spec.authors     = ["FINSYNC, Inc."]
  spec.email       = ["finsync-ops@finsync.com"]
  spec.homepage    = "TODO"
  spec.summary     = "TODO: Summary of HealthMonitor."
  spec.description = "TODO: Description of HealthMonitor. - Copyright (c) 2025 FINSYNC, Inc. All Rights Reserved."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."

  spec.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.7", ">= 6.1.7.1"
  spec.add_dependency "pg", "~> 1.2"
end
