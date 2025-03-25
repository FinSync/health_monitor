# HealthMonitor
Add a health check endpoint for AWS Load Balancer monitoring

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'health_monitor'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install health_monitor
```

## Usage
Add the Rails engine included in the gem to your routes by adding

```ruby
mount HealthMonitor::Engine, at: '/'
```

to config/routes.rb

Set the environment variable `HEALTH_MONITOR_API_TOKEN` to add a token which helps prevent denial of service attacks. Set the query parameter `API_TOKEN` with the token value when making an HTTP request. For example:

```http
https://myapp.com/health?API_TOKEN=12344321
```

### Custom Health Checks
The base checks test Postgres, Redis, and the Ruby interpreter as well as listing the Rails version. Additional health checks can be added. Each customer health check needs to be a class with a static method called `health_check`. For example:

```ruby
class TestHealthCheck
  def self.health_check
    { test_health_check: 'ok' }
  end
end
```

The class name needs to be added to the list of additional checks during setup (typically in an initializer file):

```ruby
HealthMonitor.setup do |config|
  config.additional_health_checks = ['TestHealthCheck']
end
```

## License
Copyright (c) 2025 FINSYNC, Inc. All Rights Reserved.
