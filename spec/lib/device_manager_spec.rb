require 'rails_helper'

RSpec.describe DeviceManager do


  let(:off_device){Device.create(name: "microwave", status: "off", current_consumption: "10w", location: "kitchen")}

  describe ".toggle_device" do
    let(:on_device){Device.create(name: "tv", status: "on", current_consumption: "20w", location: "livingroom")}
    context "when device status is on" do
      it "switches device off" do
        IOTPlatformAdaptor.expects(:control_device).with(on_device).returns("off")
        DeviceManager.toggle_device(on_device)
      end
    end
    context "when device status is off" do
      it "switches device on" do
        device = DeviceToggler.toggle_device(off_device.id)
        expect(device.status).to eq "on"
      end
    end
  end

end
