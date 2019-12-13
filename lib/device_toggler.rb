class DeviceToggler
  def self.toggle_device(device)
    if device.status == "on"
      device.staus = "off"
    end
    device.status = "on"
    device.save
    device
  end
end
