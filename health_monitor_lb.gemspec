require_relative "lib/health_monitor_lb/version"

Gem::Specification.new do |spec|
  spec.name        = "health_monitor_lb"
  spec.version     = HealthMonitorLb::VERSION
  spec.summary     = "Add a health check route to your Rails application for use with load balancers."

  spec.authors     = ["Alan Hecht", "Abe Petrillo", "Kevin Foster"]
  spec.email       = ["alanghecht@gmail.com", "abe.petrillo@gmail.com", "finsync-gems@finsync.com"]
  spec.description = "Add a health check route to your Rails application for use with load balancers."
  spec.license     = "MIT"

  spec.files = Dir["{app,bin,config,db,lib,spec}/**/*", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 6.1"
  spec.add_dependency "pg", "~> 1.2"

  spec.add_development_dependency "rspec-rails", "~> 6.1"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "activerecord-nulldb-adapter"
end
