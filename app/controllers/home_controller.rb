class HomeController < ApplicationController

  def index
    @filters = ActiveModel::Type::Boolean.new.cast(params.fetch(:filters, false))
    @vehicles = Vehicle.all
  end

end
