class Blacklist < ApplicationRecord
  def license=(value)
    write_attribute(:license, Vehicle.format_license(value))
  end
end
