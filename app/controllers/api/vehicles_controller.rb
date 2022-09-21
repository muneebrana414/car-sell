class Api::VehiclesController < Api::ApplicationController
  before_action :authenticate_user!
  before_action :find_vehicle, only: [:show, :destroy, :update]
  
  def user_listing
    @vehicles = current_user.vehicles.page(params[:page])
  end

  def favorite_vehicles
    @favourite = current_user.all_favorited
  end

  def show; end

  def create
    @vehicle = Vehicle.create(vehicle_params)
    @vehicle.save
  end

  def update
    authorize @vehicle
    @vehicle.update(vehicle_params)
  end

  def destroy
    authorize @vehicle
    @deleted_vehicle= Vehicle.destroy(@vehicle.id)
  end

  private

  def find_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    permitted_params = params.require(:vehicle).permit(:price, :milage, :engine_capacity, :model, :city, :color, :transmission, :engine_type, :assembly_type, :currency, :primary_contact, :secondary_contact, :user_id, :pictures)
  end
end
