class Api::VehiclesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def user_listing
    @vehicles = Vehicle.where(user_id: 6).page(params[:page])
  end

  def favorite_vehicles
    @favourite = User.find(6).all_favorited
  end

  def show
    @vehicles = Vehicle.find(params[:id])
  end

  def create
    @vehicle = Vehicle.create(vehicle_params)
    @vehicle.save(validate: false)
  end

  def update; end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    byebug
  end

  private

  def vehicle_params
    permitted_params = params.require(:vehicle).permit(:price, :milage, :engine_capacity, :model, :city, :color, :transmission, :engine_type, :assembly_type, :currency, :primary_contact, :secondary_contact, pictures: [])
    permitted_params.merge(user_id: 6)
  end
end
