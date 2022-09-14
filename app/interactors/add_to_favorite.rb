class AddToFavorite < ApplicationInteractor
  delegate :current_user, :vehicle, :favorite_list, :page, :vehicle_id, to: :context
  delegate :vehicle_ad, :favorite, to: :context

  def call
    context.favorite = ActiveModel::Type::Boolean.new.cast(favorite_list)

    context.vehicle_ad = vehicle_list

    return current_user.unfavorite(vehicle) if current_user.favorited?(vehicle)
    current_user.favorite(vehicle)
  end

  private

  def vehicle_list
    return Vehicle.find(vehicle_id) if favorite.nil?
    return Vehicle.page(page) if favorite.eql?(false)

    current_user.all_favorited if favorite
  end
end
