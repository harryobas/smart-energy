require 'rails_helper'

RSpec.describe IOTPlatformAdaptor do

  describe ".toggle_device" do
    let(:on_device){Device.create(name: "tv", status: "on", current_consumption: "20w", location: "livingroom")}
    let(:off_device){Device.create(name: "microwave", status: "off", current_consumption: "0w", location: "kitchen")}
    context 'when device is off' do
      it "truns device on" do
        Device.expects(:find_by!).with(name: off_device.name).returns(off_device)
        IOTPlatformAdaptor.toggle_device(off_device.location, off_device.name)
        expect(off_device.status).to eq "on"
        expect(off_device.current_consumption).not_to eq "0w"
      end
    end
  context "when device is on" do
    it "turns device off" do
      Device.expects(:find_by!).with(name: on_device.name).returns(on_device)
      IOTPlatformAdaptor.toggle_device(on_device.location, on_device.name)
      expect(on_device.status).to eq "off"
      expect(on_device.current_consumption).to eq "0w"
    end
  end
end
  describe "._all_devices" do
    before do
      Device.create(name: "tv", status: "on", current_consumption: "20w", location: "livingroom")
      Device.create(name: "microwave", status: "off", current_consumption: "10w", location: "kitchen")
    end
    it "returns current state for all devices" do
      devices = Device.all
      Device.expects(:all).returns(devices)
      expect(IOTPlatformAdaptor.all_devices.count).to eq 2
    end
  end
  describe "._single_device" do
    let(:device){Device.create(name: "tv", status: "on", current_consumption: "20w", location: "livingroom")}

    it "returns the current state of a single device" do
      Device.expects(:find_by!).with(name: device.name).returns(device)
      expect(IOTPlatformAdaptor.single_device(device.location, device.name)).to eq device
    end
  end

end
