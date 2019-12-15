class IOTPlatformAdaptor
  def self.toggle_device(location, name)
    device = Device.find_by!(name: name)
    if device.location == location
      case device.status
      when "off"
        device.status = "on"
        device.current_consumption = "#{rand 10..20}w"
      else
        device.status = "off"
        device.current_consumption = "0w"
      end
      device.save
      return device
    end
    nil
  end

  def self.all_devices
    Device.all
  end

  def self.single_device(location, name)
    device = Device.find_by!(name: name)
    return device if device && device.location == location
    nil
  end

end
