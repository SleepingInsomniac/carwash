class User < ApplicationRecord
  has_many :ownerships, dependent: :destroy
  has_many :vehicles, through: :ownerships
  has_many :washes
end
