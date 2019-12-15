require 'rails_helper'

RSpec.describe IOTPlatformAdaptor do
   #let(:devices){Device.all}

  describe ".control_device" do
    let(:on_device){Device.create(name: "tv", status: "on", current_consumption: "20w", location: "livingroom")}
    let(:off_device){Device.create(name: "microwave", status: "off", current_consumption: "10w", location: "kitchen")}
    context 'when device is off' do
      it "truns device on" do
        #Device.any_instance.stubs(:save).returns(true)
        off_device.expects(:save).returns(true)
        IOTPlatformAdaptor.control_device(off_device)
        expect(off_device.status).to eq "on"
      end
    end
  context "when device is on" do
    it "turns device off" do
      #Device.any_instance.stubs(:save).returns(true)
      on_device.expects(:save).returns(true)
      IOTPlatformAdaptor.control_device(on_device)
      expect(on_device.status).to eq "off"
    end
  end
end 
  describe ".get_status_of_all_devices" do
    before do
      Device.create(name: "tv", status: "on", current_consumption: "20w", location: "livingroom")
      Device.create(name: "microwave", status: "off", current_consumption: "10w", location: "kitchen")
    end
    it "returns current state for all devices" do
      devices = Device.all
      Device.expects(:all).returns(devices)
      expect(IOTPlatformAdaptor.get_status_of_all_devices.count).to eq 2
    end
  end
  describe ".get_status_of_single_device" do
    let(:device){Device.create(name: "tv", status: "on", current_consumption: "20w", location: "livingroom")}

    it "returns the current state of a single device" do
      Device.expects(:find_by_id).with(device.id).returns(device)
      expect(IOTPlatformAdaptor.get_status_of_single_device(device.id)).to eq device
    end
  end

end
