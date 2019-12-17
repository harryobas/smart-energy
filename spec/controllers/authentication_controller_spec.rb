require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  let(:valid_attributes) {
    {email: "harry@mail.com", password: "1234", password_confirmation: "1234"}
  }
  describe "POST #authenticate" do
    context "with valid email and password" do
      it "returns a token" do
        user = User.create! valid_attributes
        post :authenticate, params: {email: user.email, password: user.password}
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['auth_token'].present?).to eq true
      end
    end
    context "with invalid email" do
      it "returns error" do
        user = User.create! valid_attributes
        post :authenticate, params: {email: "bob@exmple.com", password: user.password}
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['error']['user_authentication']).to eq "invalid credentials"
      end
    end
    context "with invalid password" do
      it "returns error" do
        user = User.create! valid_attributes
        post :authenticate, params: {email: user.email, password: "xxxxx"}
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['error']['user_authentication']).to eq "invalid credentials"  
      end
    end
  end

end
