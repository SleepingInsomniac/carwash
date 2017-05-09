class AddLicenseAndTypeToWash < ActiveRecord::Migration[5.1]
  def change
    add_column :washes, :license, :string
    add_column :washes, :vehicle_type, :string
  end
end
