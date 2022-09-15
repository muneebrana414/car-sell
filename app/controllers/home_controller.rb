class HomeController < ApplicationController
  before_action :find_vehicle, only: [:add_to_favorite]

  def index
    @filters = ActiveModel::Type::Boolean.new.cast(params.fetch(:filters, false))
    @vehicles = Vehicle.where.not(primary_contact: "").page(params[:page])
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

  def find_vehicle
    vehicle_id = params.dig(:vehicle, :vehicle_id) || params.dig(:vehicle_id)
    @vehicle = Vehicle.find_by(id: vehicle_id)
  end
end
