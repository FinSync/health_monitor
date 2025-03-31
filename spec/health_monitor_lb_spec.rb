# frozen_string_literal: true
require "rails_helper"

RSpec.describe HealthMonitorLb do
  it "has a version number" do
    expect(HealthMonitorLb::VERSION).not_to be nil
  end
end
