class DeviceManager
  def self.toggle_device(device)
    IOTPlatformAdaptor.control_device(device)
  end

  def self.all_devices
    IOTPlatformAdaptor.get_status_of_all_devices
  end

  def self.single_device(device_id)
    IOTPlatformAdaptor.get_status_of_single_device(device_id)
  end

end
