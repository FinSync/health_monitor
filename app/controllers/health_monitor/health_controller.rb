module HealthMonitor
  class HealthController < ApplicationController
    def index
      status = HealthCheckService.new.call

      response.set_header('Cache-Control', 'no-cache, no-store, must-revalidate')
      response.set_header('Pragma', 'no-cache')
      response.set_header('Expires', '0')

      render json: status, status: :ok
    end
  end
end
