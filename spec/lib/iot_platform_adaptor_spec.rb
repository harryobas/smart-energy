require 'rails_helper'

RSpec.describe IOTPlatformAdaptor do

    let(:on_device){Device.create(name: "tv", status: "on", current_consumption: "20w", location: "livingroom")}
    let(:off_device){Device.create(name: "microwave", status: "off", current_consumption: "10w", location: "kitchen")}

  describe ".control_device" do
    context 'when device is off' do
      it "truns device on" do
        #Device.any_instance.stubs(:save).returns(true)
        off_device.expects(:save).returns(true)
        IOTPlatformAdaptor.control_device(off_device)
        expect(off_device.status).to eq "on"
      end
    end
  end
  context "when device is on" do
    it "turns device off" do
      Device.any_instance.stubs(:save).returns(true)
      IOTPlatformAdaptor.control_device(on_device)

    end
  end
  describe ".single" do
    it "returns current status for a single device" do
      device = DeviceStatusReporter.single(Device.first.id)
      expect(device).to eq Device.first
    end
  end

end
