require 'rails_helper'

RSpec.describe AuthenticateUser do
  let(:user){User.create(email: "example@mail.com", password: "55555", password_confirmation: "55555")}
  describe ".call" do
    it "returns success" do
      expect(AuthenticateUser.call(user.email, user.password).success?).to eq true
    end
  end
end
