class DeviceStatusReporter

  def self.all
    Device.all
  end

  def self.single(device_id)
    device = Device.find_by_id(device_id)
  end
end
