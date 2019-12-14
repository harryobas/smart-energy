require 'rails_helper'

RSpec.describe DeviceManager do

  let(:device_one){Device.create(name: "microwave", status: "on", current_consumption: "20w", location: "kitchen")}
  let(:device_two){Device.create(name: "tv", status: "off", current_consumption: "10w", location: "kitchen")}
  let(:devices){Device.all}

  describe ".toggle_device" do
    it "changes a device status" do
      IOTPlatformAdaptor.expects(:control_device).with(device_one).returns(device_one)
      DeviceManager.toggle_device(device_one)
    end
  end

  describe ".all_devices" do
    it "returns current status of all monitored devices" do
      IOTPlatformAdaptor.expects(:get_status_of_all_devices).returns(devices)
      DeviceManager.all_devices
    end
  end

  describe ".single_device" do
    it "rethrns current status of a device" do
      IOTPlatformAdaptor.expects(:get_status_of_single_device).with(device_one.id).returns(device_one)
      DeviceManager.single_device(device_one.id)
    end
  end


end
