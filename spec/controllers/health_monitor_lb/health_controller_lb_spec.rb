require 'rails_helper'

module HealthControllerLbSpec
  class TestHealthCheck
    def self.health_check
      { 'test_health_check' => 'ok' }
    end
  end
end

describe HealthMonitorLb::HealthController, type: :controller do
  routes { HealthMonitorLb::Engine.routes }

  context 'not authorized' do
    it 'returns unauthorized without a token' do
      get :index
      expect(response.status).to eq(401)
    end
  end

  context 'authorized' do
    it 'returns ok with a token' do
      get :index, params: { API_TOKEN: ENV['HEALTH_MONITOR_API_TOKEN'] }
      expect(response.status).to eq(200)

      expect(response.parsed_body).to include({ 'rails_version' => Rails::VERSION::STRING, 'ruby' => 'ok' })
    end

    it 'handles custom checks' do
      HealthMonitorLb.additional_health_checks = ['HealthControllerLbSpec::TestHealthCheck']

      get :index, params: { API_TOKEN: ENV['HEALTH_MONITOR_API_TOKEN'] }
      expect(response.status).to eq(200)

      expect(response.parsed_body).to include({ 'rails_version' => Rails::VERSION::STRING, 'ruby' => 'ok', 'test_health_check' => 'ok' })

      HealthMonitorLb.additional_health_checks = []
    end
  end
end
