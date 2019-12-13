require 'rails_helper'

RSpec.describe IOTServiceAdaptor do

  let(:current_status) do
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

  describe ".energy_consumption_status" do
    it "returns the current energy consuption status of monitored devices" do
      site_id = "s13"
      energy_status = IOTServiceAdaptor.energy_consumption_status(site_id)
      expect(energy_status).to eq current_status 
    end
  end

end
