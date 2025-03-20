source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in health_monitor.gemspec.
gemspec

gem 'concurrent-ruby', '1.3.4'

group :development, :test do
  gem "rspec-rails", "~> 6.1"
  gem 'rspec-its'
  gem 'activerecord-nulldb-adapter'
end

# To use a debugger
# gem 'byebug', group: [:development, :test]
