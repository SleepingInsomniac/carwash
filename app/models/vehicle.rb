class Vehicle < ApplicationRecord
  enum vehicle_type: %i[car truck]
  has_many :washes
  has_many :ownerships, dependent: :destroy
  has_many :users, through: :ownerships
  validates :license, presence: true, uniqueness: true, format: { with: /[A-Z\d]+/ }, length: { in: 1..8 }

  def license=(value)
    write_attribute(:license, Vehicle.format_license(value))
  end

  def blacklisted?
    Blacklist.where(license: license).any?
  end

  def self.format_license(value)
    value.upcase.gsub(/[^A-Z\d]*/, '')
  end

end
