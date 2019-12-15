class IOTPlatformAdaptor

  def self.toggle_device(location, name)
    device = Device.find_by!(name: name)
    if device && device.location == location
      case device.status
      when "on"
        device.status = "off"
      else
        device.status = "on"
      end
      device.save
      return device
    end
  end

  def self.all_devices
    Device.all
  end

  def self.single_device(location, name)
    device = Device.find_by!(name: name)
    return device if device && device.location == location
  end

end
