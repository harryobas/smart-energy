class IOTServiceAdaptor
  def self.energy_consumption_status(site_id)
    {
      "livingroom"=>{
        "sensor" => {"name" => "lrsensor"},
        "devices" => [{"name"=>"tv", "status"=>"on", "power"=>"20w"}, {"name"=>"lamp", "status"=>"off", "power"=>"0w"}]
      },
      "kitchen"=>{
        "sensor" => {"name" => "ksensor"},
        "devices" => [{"name"=>"toaster", "status"=>"on", "power"=>"10w"}, {"name"=>"microwave", "status"=>"off", "power"=>"0w"}]
      }


    }
  end
end
