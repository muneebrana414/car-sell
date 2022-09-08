class HomeController < ApplicationController

  def index
    #     @filters = ActiveModel::Type::Boolean.new.cast(params.fetch(:filters, true))
    @filters = true
  end

  def new
    @filters = ActiveModel::Type::Boolean.new.cast(params[:filters])
  end
end
