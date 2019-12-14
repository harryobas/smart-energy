require 'rails_helper'

RSpec.describe DeviceManager do

  describe ".toggle_device" do
    let(:on_device){Device.create(name: "microwave", status: "on", current_consumption: "20w", location: "kitchen")}
    let(:off_device){Device.create(name: "tv", status: "off", current_consumption: "10w", location: "kitchen")}
    context "when device status is on" do
      it "switches device off" do
        IOTPlatformAdaptor.expects(:control_device).with(on_device).returns("off")
        DeviceManager.toggle_device(on_device)
      end
    end
    context "when device status is off" do
      it "switches device on" do
        IOTPlatformAdaptor.expects(:control_device).with(off_device).returns("on")
        DeviceManager.toggle_device(off_device)
      end
    end
  end

end
