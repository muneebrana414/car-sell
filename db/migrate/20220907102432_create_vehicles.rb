class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :city, null: false, default: ""
      t.string :milage, null: false, default: ""
      t.string :price, null: false, default: ""
      t.string :color, null: false, default: ""
      t.integer :transmission, null: false, default: 0
      t.string :model, null: false, default: ""
      t.string :engine_type, null: false, default: ""
      t.string :engine_capacity, null: false, default: ""
      t.integer :assembly_type, null: false, default: 0
      t.string :primary_contact, null: false, default: ""
      t.string :secondary_contact, null: false, default: ""
      t.timestamps
    end
  end
end