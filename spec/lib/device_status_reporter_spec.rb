require 'rails_helper'

RSpec.describe DeviceStatusReporter do
  before(:each) do
    Device.create(name: "tv", status: "on", current_consumption: "20w", location: "livingroom")
    Device.create(name: "microwave", status: "off", current_consumption: "10w", location: "kitchen")
  end
  describe ".all" do
    it 'returns current status of all devices' do
      expect(DeviceStatusReporter.all.count).to eq 2
    end
  end
  describe ".single" do
    it "returns current status for a single device" do
      device = DeviceStatusReporter.single(Device.first.id)
      expect(device).to eq Device.first
    end
  end

end
