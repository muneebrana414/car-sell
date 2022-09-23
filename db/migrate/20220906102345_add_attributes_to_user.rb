class AddAttributesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string, null: false, unique: true
    add_column :users, :phone_number, :string, null: false
  end
end
