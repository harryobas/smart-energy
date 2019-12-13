require 'rails_helper'

RSpec.describe DeviceToggler do

  let(:on_device){Device.create(name: "tv", status: "on", current_consumption: "20w", location: "livingroom")}
  let(:off_device){Device.create(name: "microwave", status: "off", current_consumption: "10w", location: "kitchen")}

  describe ".toggle_device" do
    context "when device status is on" do
      it "switches device off" do
        device = DeviceToggler.toggle_device(on_device)
        expect(device.status).to eq "off"
      end
    end
    context "when device status is off" do
      it "switches device on" do
        device = DeviceToggler.toggle_device(off_device)
        expect(device.status).to eq "on"
      end
    end
  end

end
