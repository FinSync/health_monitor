module HealthMonitorLb
  class HealthController < ApplicationController
    before_action :disable_ssl, only: :disable_ssl_actions

    def index
      status = HealthCheckService.new.call

      response.set_header('Cache-Control', 'no-cache, no-store, must-revalidate')
      response.set_header('Pragma', 'no-cache')
      response.set_header('Expires', '0')

      render json: status, status: :ok
    end

    def disable_ssl
      # This is a workaround for the issue with SSL termination in AWS ELB
      # where the health check URL is not accessible over HTTP.
      redirect_to request.url.gsub(/https/i, 'http') if request.ssl?
    end

    def disable_ssl_actions
      actions = []
      actions << :index unless ENV['ENABLE_HEALTH_CHECK_SSL']
      actions
    end
  end
end
