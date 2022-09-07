class HomeController < ApplicationController
  before_action :authenticate_user! 
  def index
    @filters = true
  end

  def new
    @filters = ActiveModel::Type::Boolean.new.cast(params[:filters])
  end
end
