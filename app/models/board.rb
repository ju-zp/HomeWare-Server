class Board < ApplicationRecord
  belongs_to :home
  has_many :lights
  has_many :temperatures
  has_many :temperature_readings, through: :temperatures
end
