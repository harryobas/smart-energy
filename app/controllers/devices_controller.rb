class DevicesController < ApplicationController
  before_action :set_device, only: [:update]

rescue_from ActiveRecord::RecordNotFound do |e|
  render json: e.message, status: :unprocessable_entity
end

  # GET /devices
  def index
    @devices = DeviceManager.all_devices
    render json: @devices
  end

  # GET /devices/1
  def show
    @device = DeviceManager.single_device(params[:id])
    render json: @device
  end

  # PATCH/PUT /devices/1
  def update
    @device = DeviceManager.toggle_device(@device)
    render json: @device
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

end
