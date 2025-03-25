module HealthMonitor
  class ApplicationController < ActionController::API
    before_action :check_api_token

    def check_api_token
      if ENV['HEALTH_MONITOR_API_TOKEN'].present? && (params['API_TOKEN'] != ENV['HEALTH_MONITOR_API_TOKEN'])
        render json: 'unauthorized', status: :unauthorized
      end
    end
  end
end
