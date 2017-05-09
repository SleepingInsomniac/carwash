class Wash < ApplicationRecord
  belongs_to :vehicle
  has_many :charges
  belongs_to :user
  before_save :calculate_total
  before_save :copy_vehicle_attributes
  before_validation :check_blacklist
  before_validation :check_truck_bed

  def bed_is_up=(value)
    @bed_is_up = ['1', 1, true].include? value
  end

  def bed_is_up?
    !!@bed_is_up
  end

  def mud_in_bed=(value)
    @mud_in_bed = ['1', 1, true].include? value
  end

  def mud_in_bed?
    !!@mud_in_bed
  end

  def calculated_total
    self.charges.reduce(0) { |acc, charge| charge.is_credit? ? acc - charge.amount : acc + charge.amount}
  end

  private

  def check_blacklist
    if vehicle && vehicle.blacklisted?
      errors.add :vehicle, "This vehicle has been reported as stolen!"
    end
  end

  def calculate_total
    self.total = calculated_total
  end

  def check_truck_bed
    if vehicle && vehicle.truck? && !bed_is_up?
      errors.add :vehicle, "Truck bed must be up"
    end
  end

  def copy_vehicle_attributes
    if vehicle
      self.license = vehicle.license
      self.vehicle_type = vehicle.vehicle_type
    end
  end

end
