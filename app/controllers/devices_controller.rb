class DevicesController < ApplicationController


rescue_from ActiveRecord::RecordNotFound do |e|
  render json: {error: e.message}, status: :unprocessable_entity
end

  def index
    @devices = IOTPlatformAdaptor.all_devices
    render json: @devices
  end

  def show
    @device = IOTPlatformAdaptor.single_device(params[:location], params[:name])
    if @device
      return render json: @device
    end
    render json: {error: "unknown device"}, status: :unprocessable_entity
  end

  def update
    @device = IOTPlatformAdaptor.toggle_device(params[:location], params[:name])
    if @device
      return render json: @device
    end
    render json: {error: "unknown device"}, status: :unprocessable_entity
  end


end
