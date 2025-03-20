require 'rails_helper'

module HealthControllerSpec
  class TestHealthCheck
    def self.health_check
      { 'test_health_check' => 'ok' }
    end
  end
end

describe HealthMonitor::HealthController, type: :controller do
  routes { HealthMonitor::Engine.routes }

  context 'not authorized' do
    it 'returns unauthorized without a token' do
      get :index
      expect(response.status).to eq(401)
    end
  end

  context 'authorized' do
    it 'returns ok with a token' do
      request.headers['HTTP_API_TOKEN'] = ENV['HEALTH_MONITOR_API_TOKEN']
      get :index
      expect(response.status).to eq(200)

      expect(response.parsed_body).to include({ 'rails_version' => Rails::VERSION::STRING, 'ruby' => 'ok' })
    end

    it 'handles custom checks' do
      HealthMonitor.additional_health_checks = ['HealthControllerSpec::TestHealthCheck']

      request.headers['HTTP_API_TOKEN'] = ENV['HEALTH_MONITOR_API_TOKEN']
      get :index
      expect(response.status).to eq(200)

      expect(response.parsed_body).to include({ 'rails_version' => Rails::VERSION::STRING, 'ruby' => 'ok', 'test_health_check' => 'ok' })

      HealthMonitor.additional_health_checks = []
    end
  end
end
