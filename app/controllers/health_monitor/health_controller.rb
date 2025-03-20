module HealthMonitor
  class HealthController < ApplicationController
    def index
      status = HealthCheckService.new.call
      render json: status, status: :ok
    end
  end
end
