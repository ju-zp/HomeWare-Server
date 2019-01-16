class Board < ApplicationRecord
  belongs_to :home
  has_many :lights
  has_many :temperature_readings
end
