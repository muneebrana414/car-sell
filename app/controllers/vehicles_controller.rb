class VehiclesController < ApplicationController

  def user_listing
    @vehicles = current_user.vehicles.page(params[:page])
  end

  def favorite_vehicles; end

  def show
    @vehicles = Vehicle.find(params[:id])
  end

  def update; end

  def create
    @vehicle = current_user.vehicles.build
    @vehicle.save(validate: false)
    redirect_to vehicle_steps_path(@vehicle)
  end

  private

end
