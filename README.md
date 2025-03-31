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

(The MIT License)

Copyright (c) 2009 Jonas Nicklas

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
