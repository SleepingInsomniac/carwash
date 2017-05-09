class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.integer :vehicle_type
      t.string :license, index: true, null: false

      t.timestamps
    end
  end
end
