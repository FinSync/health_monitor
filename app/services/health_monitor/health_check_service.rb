module HealthMonitor
  class HealthCheckService
    def call
      status = { rails_version: Rails::VERSION::STRING }
               .merge(ruby_check)
               .merge(postgres_check)
               .merge(redis_check)

      HealthMonitor.additional_health_checks.each do |health_check_klass|
        status = status.merge(health_check_klass.safe_constantize.health_check)
      end

      status
    end

    def ruby_check
      status = "2\n" == `ruby -e 'puts 1 + 1'` ? 'ok' : 'down'

      { ruby: status }
    end

    def postgres_check
      return {} if ENV['DATABASE_URL'].blank?

      pg_conn = PG::Connection.open(ENV['DATABASE_URL'])
      status = pg_conn.connect_poll ? 'ok' : 'down'

      { db: status }
    end

    def redis_check
      return {} if ENV['REDIS_URL'].blank?

      redis = Redis.new(url: ENV['REDIS_URL'], ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })
      status = redis.ping == 'PONG' ? 'ok' : 'down'

      { redis: status }
    end
  end
end
