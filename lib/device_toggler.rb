class DeviceToggler
  def self.toggle_device(device_id)
    Device.update(device_id, attributes)
    device = Device.find_by_id(device_id)
    case device.status
    when "on"
      device.status = "off"
    else
      device.status = "on"
    end
    device.save
    device
  end
end
