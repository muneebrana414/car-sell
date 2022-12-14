class HomeController < ApplicationController
  before_action :find_vehicle, only: [:add_to_favorite]

  def index
    result = SearchFilters.call(
      searching_filters: search_params.values.reject(&:blank?),
      page: params[:page]
    )
    flash[:notice] = 'No record find.' if result.flash
    @vehicles = result.vehicles
  end

  def add_to_favorite
    result = AddToFavorite.call(
      current_user: current_user,
      vehicle: @vehicle,
      favorite_list: params[:favorite_list],
      page: params[:page],
      vehicle_id: params[:vehicle_id]
    )
    @vehicles = result.vehicle_ad
    @favorite_list = result.favorite
  end

  private

  def search_params
    params.permit(:price, :milage, :engine_capacity, :model, :city, :color, :transmission, :engine_type, :assembly_type)
  end
  def find_vehicle
    vehicle_id = params.dig(:vehicle, :vehicle_id) || params.dig(:vehicle_id)
    @vehicle = Vehicle.find_by(id: vehicle_id)
  end
end
