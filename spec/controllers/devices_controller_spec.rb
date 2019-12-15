require 'rails_helper'

RSpec.describe DevicesController, type: :controller do

  let(:valid_attributes) {
    {name: "tv", status: "on", current_consumption: "20w", location: "livingroom"}
  }

  describe "GET #index" do
    it "returns a success response" do
      device = Device.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      device = Device.create! valid_attributes
      get :show, params: {location: device.location, name: device.name}
      expect(response).to be_successful
    end
  end

  describe "PATCH #update" do
    context "with valid device name and location" do
      it "updates the requested device status" do
        device = Device.create! valid_attributes
        patch :update, params: {location: device.location, name: device.name}
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['status']).to eq "off"
      end

      it "renders a JSON response with the device" do
        device = Device.create! valid_attributes
        patch :update, params: {location: device.location, name: device.name}
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid device name" do
      it "renders a JSON response with errors for the device" do
        device = Device.create! valid_attributes
        patch :update, params: {location: device.location, name: "bingo"}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end



end
