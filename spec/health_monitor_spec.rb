# frozen_string_literal: true
require "rails_helper"

RSpec.describe HealthMonitor do
  it "has a version number" do
    expect(HealthMonitor::VERSION).not_to be nil
  end
end
