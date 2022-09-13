class HomeController < ApplicationController

  def index
    @filters = ActiveModel::Type::Boolean.new.cast(params.fetch(:filters, false))
    @vehicles = Vehicle.page(params[:page])
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end
end
