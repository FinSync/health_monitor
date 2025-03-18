module HealthMonitor
  class HealthController < ApplicationController
    def index
      status = HealthCheckService.new.call
      render json: status
    end
  end
end
