class VehiclesController < ApplicationController
  include Wicked::Wizard
  before_action :find_vehicle, only: [:show, :update]

  steps :vehicle_details, :vehicle_images, :vehicle_contacts

  def show
    render_wizard
  end

  def update
    case step
    when :vehicle_images
      @vehicle.update(user_detail_params)
    when :vehicle_contacts
      @vehicle.update(user_image_params)
    end
    if params[:id] != "wicked_finish"
      render_wizard
    else
      @vehicle.update(user_contact_params)
      render "wicked_finish"
    end
  end

  private

  def find_vehicle
    @vehicle = Vehicle.find_by(id: params[:vehicle].present? ? params[:vehicle][:vehicle_id] : params[:vehicle_id])

    @vehicle = Vehicle.new if @vehicle.blank?
  end

  def user_detail_params
    params.require(:vehicle).permit(:city, :milage, :model, :engine_type, :price, :currency, :transmission, :color, :assembly_type, :engine_capacity)
  end

  def user_image_params
    params.require(:vehicle).permit(pictures: [])
  end

  def user_contact_params
    params.require(:vehicle).permit(:primary_contact,:secondary_contact)
  end
end
