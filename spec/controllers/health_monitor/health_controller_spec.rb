require 'rails_helper'

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
    end
  end
end
