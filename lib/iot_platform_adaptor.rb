class IOTPlatformAdaptor

  def self.control_device(device)
    case device.status
    when "on"
      device.status = "off"
    else
      device.status = "on"
    end
    device.save
    device
  end

  def self.get_status_of_all_devices
    Device.all
  end

  def self.get_status_of_single_device(device_id)
    Device.find_by_id(device_id)
  end
end
