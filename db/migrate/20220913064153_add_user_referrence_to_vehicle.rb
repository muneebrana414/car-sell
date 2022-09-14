class AddUserReferrenceToVehicle < ActiveRecord::Migration[5.2]
  def change
    add_reference :vehicles, :user, index: true
  end
end
