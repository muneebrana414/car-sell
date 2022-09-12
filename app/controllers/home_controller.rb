class HomeController < ApplicationController

  def index
    @filters = ActiveModel::Type::Boolean.new.cast(params.fetch(:filters, false))
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end
end
