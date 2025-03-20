# frozen_string_literal: true
ENV['RAILS_ENV'] ||= 'test'
ENV['RAILS_ENV'] = 'test' if ENV['RAILS_ENV'] == 'development' # AKA running rspec directly from the command line

require File.expand_path('../dummy/config/environment.rb', __FILE__)
require "action_controller/railtie"
require 'rspec/rails'
require 'nulldb_rspec'
include NullDB::RSpec::NullifiedDatabase

require "health_monitor"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.expose_dsl_globally = true

  config.before(:suite) do
    ENV['HEALTH_MONITOR_API_TOKEN'] = 'foobar'
  end

  config.include Rails.application.routes.url_helpers
end
