class DevicesController < ApplicationController
  before_action :set_device, only: [:update]

rescue_from ActiveRecord::RecordNotFound do |e|
  render json: e.message, status: :unprocessable_entity
end

  # GET /devices
  def index
    @devices = DeviceStatusReporter.all
    render json: @devices
  end

  # GET /devices/1
  def show
    @device = DeviceStatusReporter.single(params[:id])
    render json: @device
  end

  # PATCH/PUT /devices/1
  def update
    @device = DeviceToggler.toggle_device(params[:id])
    render json: @device 
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def device_params
      params.require(:device).permit(:status)
    end
end
