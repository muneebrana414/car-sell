class HomeController < ApplicationController
  before_action :find_vehicle, only: [:add_to_favorite]

  def index
    @filters = ActiveModel::Type::Boolean.new.cast(params.fetch(:filters, false))
    @vehicles = Vehicle.page(params[:page])
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def add_to_favorite
    @favorite_list = ActiveModel::Type::Boolean.new.cast(params[:favorite_list])
    if @favorite_list == true
      @vehicles = Vehicle.page(params[:page])
    elsif @favorite_list == false
      @vehicles = current_user.all_favorited
    else
      @vehicle = Vehicle.find(params[:vehicle_id])
    end
    return current_user.unfavorite(@vehicle) if current_user.favorited?(@vehicle)
    current_user.favorite(@vehicle)
  end

  private

  def find_vehicle
    @vehicle = Vehicle.find_by(id: params[:vehicle].present? ? params[:vehicle][:vehicle_id] : params[:vehicle_id])
  end
end
