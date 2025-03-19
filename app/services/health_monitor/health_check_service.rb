module HealthMonitor
  class HealthCheckService
    def call
      status = { rails_version: Rails::VERSION::STRING }
               .merge(ruby_check)
               .merge(postgres_check)
               .merge(redis_check)

      HealthMonitor.additional_checks.each do |check_klass|
        status = status.merge(check_klass.safe_constantize.status_check)
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
