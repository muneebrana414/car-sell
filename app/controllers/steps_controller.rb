class StepsController < ApplicationController
  include Wicked::Wizard
  before_action :authenticate_user!
  before_action :find_vehicle, only: [:show, :update]
  before_action :validate_user, only: [:show, :update]
  
  steps *Vehicle.form_steps

  def show
    render_wizard
  end

  def update
    @vehicle.update(vehicle_params(step))
    render_wizard @vehicle
  end

  private

  def find_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def validate_user
    @authorized = current_user.id == @vehicle.user_id
    redirect_to vehicle_path(@vehicle), notice: "Not Authorized" unless @authorized
  end

  def vehicle_params(step)
    permitted_attributes = case step
                           when "details"
                             [:city, :milage, :model, :engine_type, :price, :currency, :transmission, :color, :assembly_type, :engine_capacity, :user_id]
                           when "images"
                             [pictures: []]
                           when "contacts"
                             [:primary_contact,:secondary_contact]
                           end

    params.require(:vehicle).permit(permitted_attributes).merge(form_step: step)
  end

end

