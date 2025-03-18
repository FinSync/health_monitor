module HealthMonitor
  class HealthCheckService
    def call
      status = { rails_version: Rails::VERSION::STRING }

      status.merge!(postgres_check)
      status.merge!(redis_check)
    end

    def postgres_check
      return {} if ENV['DATABASE_URL'].blank?

      pg_conn = PG::Connection.open(ENV['DATABASE_URL'])
      status = pg_conn.connect_poll ? 'ok' : 'down'

      { db: status }
    end

    def redis_check
      {}
    end
  end
end
