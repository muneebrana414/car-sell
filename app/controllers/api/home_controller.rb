class Api::HomeController < ApplicationController
  before_action :find_vehicle, only: [:add_to_favorite]
  skip_before_action :verify_authenticity_token

  def index
    result = SearchFilters.call(
      searching_filters: search_params.values.reject(&:blank?),
      page: params[:page]
    )
    @vehicles = result.vehicles
  end

  def add_to_favorite
    result = AddToFavorite.call(
      current_user: User.find(6),
      vehicle: @vehicle,
      page: params[:page],
      vehicle_id: params[:vehicle_id]
    )
    @vehicle = result.vehicle_ad
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
